defmodule MyppeWeb.Admin.BookingController do
  use MyppeWeb, :controller

  def index(conn, %{"date" => date, "time" => time} = _params) do
    slot_id = Myppe.Bookings.get_slot_id(date, time)
    quarter = Myppe.Bookings.get_quarter_from_time(time)
    pharmacy = Myppe.Inventories.get_pharmacy_for_user(conn.assigns.current_admin)
    slot = Myppe.Bookings.get_slot(pharmacy, slot_id)
    bookings =
      case slot do
        nil ->
          []
        slot ->
          timeslot =
            Myppe.Bookings.get_timeslot(slot, quarter)
            |> Myppe.Repo.preload([bookings: [timeslot: [:slot], line_items: [:product]]])
          case timeslot do
            nil ->
              []
            timeslot ->
              timeslot.bookings
          end
      end
    require IEx; IEx.pry
    conn
    |> render("index.json", bookings: bookings)
  end

  def show(conn, %{"id" => id}) do
    booking =
      Myppe.Bookings.get_booking!(id)
      |> Myppe.Repo.preload([:user, timeslot: [:slot], line_items: [:product]])
    conn
    |> render("show.json", booking: booking)
  end

  def update(conn, %{"id" => id, "status" => status}) do
    booking = Myppe.Bookings.get_booking!(id)
      |> Myppe.Repo.preload([:user, :pharmacy, line_items: [:product]])
    pharmacy = Myppe.Inventories.get_pharmacy!(booking.pharmacy.id)
    changes =
      booking.line_items
      |>  Enum.map(fn i -> %{"code" => i.product.code, "change" => (-1 * i.quantity) } end )
    res =
      case status do
        "success" ->
          case Myppe.Inventories.update_and_record_stock_changes(pharmacy, changes) do
            {:ok, _} ->
                Myppe.Bookings.update_booking(booking, %{status: status})
            {:error, {:changes, code}, {:error, cs}, _} ->
              {:error, "#{code} is out of stock"}
            _ ->
              {:error, "Something went wrong"}
          end
        _ ->
          Myppe.Bookings.update_booking(booking, %{status: status})
      end

    case res do
      {:ok, updated_booking} ->
        conn
        |> put_resp_header("location", Routes.admin_booking_path(conn, :show, id))
        |> render("show.json", booking: updated_booking)

      {:error, message} ->
        conn
        |> put_view(MyppeWeb.ErrorView)
        |> render("error.json", message: message)
    end
  end
end
