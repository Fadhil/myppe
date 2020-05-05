defmodule MyppeWeb.Pharmacy.TimeslotView do
  use MyppeWeb, :view
  alias MyppeWeb.Pharmacy.TimeslotView

  def render("index.json", %{timeslots: timeslots}) do
    timeslots_by_date =
      timeslots
      |> Enum.group_by(fn t -> t.date end)
    %{success: true, data: render_many(timeslots_by_date, TimeslotView, "timeslot_by_date.json", as: :timeslot_by_date)}
  end

  def render("timeslot_by_date.json", %{timeslot_by_date: timeslot_by_date}) do
    {k, v} = timeslot_by_date
    %{
      date: k,
      available_slots: render_many(v, TimeslotView, "timeslot.json")
    }
  end

  def render("timeslot.json", %{timeslot: timeslot}) do
    %{
      current_bookings: timeslot.current_bookings,
      status: timeslot.status,
      time: timeslot.time,
      timeslot_id: timeslot.timeslot_id
    }
  end
end
