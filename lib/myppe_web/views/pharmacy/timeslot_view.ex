defmodule MyppeWeb.Pharmacy.TimeslotView do
  use MyppeWeb, :view
  alias MyppeWeb.Pharmacy.TimeslotView

  def render("index.json", %{timeslots: timeslots}) do
    %{success: true, data: render_many(timeslots, TimeslotView, "timeslot.json")}
  end

  def render("timeslot.json", %{timeslot: timeslot}) do
    %{
      current_bookings: timeslot.current_bookings,
      date: timeslot.date,
      status: timeslot.status,
      time: timeslot.time,
      timeslot_id: timeslot.timeslot_id
    }
  end
end
