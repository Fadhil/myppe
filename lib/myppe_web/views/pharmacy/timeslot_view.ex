defmodule MyppeWeb.Pharmacy.TimeslotView do
  use MyppeWeb, :view
  alias MyppeWeb.Pharmacy.TimeslotView

  def render("index.json", %{timeslots: timeslots}) do
    %{success: true, data: render_many(timeslots, TimeslotView, "timeslot.json")}
  end

  def render("timeslot.json", %{timeslot: timeslot}) do
    %{
      id: timeslot.id

    }
  end
end
