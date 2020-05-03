defmodule MyppeWeb.Admin.BookingView do
  use MyppeWeb, :view
  alias MyppeWeb.Admin.BookingView

  def render("index.json", %{bookings: bookings}) do
    %{success: true, data: render_many(bookings, BookingView, "booking.json")}
  end

  def render("booking.json", %{booking: booking}) do
    %{
      id: booking.id,
      status: booking.status
    }
  end
end
