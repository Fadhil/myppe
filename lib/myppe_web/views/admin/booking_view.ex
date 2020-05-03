defmodule MyppeWeb.Admin.BookingView do
  use MyppeWeb, :view
  alias MyppeWeb.Admin.BookingView

  def render("index.json", %{bookings: bookings}) do
    %{success: true, data: render_many(bookings, BookingView, "booking.json")}
  end

  def render("booking.json", %{booking: booking}) do
    %{
      booking_id: booking.id,
      email: booking.user.email,
      id_type: get_id_type(booking.user),
      id_number: booking.user.id_number,
      expired: false,
      status: booking.status
    }
  end

  def get_id_type(%{is_malaysian: true}) do
    "IC"
  end

  def get_id_type(%{is_malaysian: false}) do
    "Passport/Other"
  end

  def get_time(booking) do
    hour = Myppe.Bookings.get_hour(booking.timeslot.slot.slot_id)
    minute = Myppe.Bookings.quarter_to_minute(booking.timeslot.quarter)
    hour <> ":" <> minute
  end
end
