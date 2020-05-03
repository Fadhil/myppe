defmodule MyppeWeb.BookingController do
  use MyppeWeb, :controller

  def create(conn, %{
    "items" => line_items,
    "pharmacy_id" => pharmacy_id,
    "timeslot_id" => slot_timeslot_id
  } = _params) do

    case Myppe.Bookings.create_booking(
      conn.assigns.current_user, pharmacy_id, slot_timeslot_id, line_items
    ) do
      {:ok, booking} ->
        booking =
          booking
          |> Myppe.Repo.preload([line_items: [:product]])
        conn
        |> put_resp_header("location", Routes.booking_path(conn, :show, booking.id))
        |> render("show.json", booking: booking)

      {:error, changeset} ->
        conn
        |> put_status(:bad_request)
        |> put_view(MyppeWeb.ErrorView)
        |> put_view(MyppeWeb.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end
end
