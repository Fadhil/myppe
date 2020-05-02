defmodule MyppeWeb.Pharmacy.TimeslotController do
  use MyppeWeb, :controller

  def index(conn, %{"pharmacy_id" => pharmacy_id}) do
    pharmacy =
      Myppe.Bookings.get_pharmacy!(pharmacy_id)
      |> Myppe.Repo.preload(:opening_hours)

    conn
    |> render("index.json", timeslots: [])
  end

  def create(conn, %{"pharmacy_id" => pharmacy_id, "preferred_slots" => preferred_slots}) do
    pharmacy =
      Myppe.Bookings.get_pharmacy!(pharmacy_id)
      |> Myppe.Repo.preload(:opening_hours)
    res = Myppe.Bookings.available_timeslots(pharmacy, preferred_slots)
    conn
    |> put_resp_header("location", Routes.pharmacy_timeslot_path(conn, :index, pharmacy_id))
    |> render("index.json", timeslots: [])
  end
end
