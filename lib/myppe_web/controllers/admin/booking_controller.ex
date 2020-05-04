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
          timeslot.bookings
      end
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
end
