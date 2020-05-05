defmodule MyppeWeb.Admin.BookingView do
  use MyppeWeb, :view
  alias MyppeWeb.Admin.BookingView

  def render("index.json", %{bookings: bookings}) do
    %{success: true, data: render_many(bookings, BookingView, "booking.json")}
  end

  def render("show.json", %{booking: booking}) do
    %{success: true, data: render_one(booking, BookingView, "booking.json")}
  end

  def render("booking.json", %{booking: booking}) do
    %{
      booking_id: booking.id,
      email: booking.user.email,
      id_type: get_id_type(booking.user),
      id_number: booking.user.id_number,
      expired: false,
      status: booking.status,
      three_ply: get_requested_quantity("three_ply", booking.line_items),
      n95: get_requested_quantity("n95", booking.line_items),
      sanitizer: get_requested_quantity("sanitizer", booking.line_items),
      gloves: get_requested_quantity("gloves", booking.line_items),

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

  def get_requested_quantity(code, line_items) do
    product = Myppe.Inventories.get_product_by_code(code)
    item =
      line_items
      |> Enum.filter(fn i -> i.product_id == product.id end)
      |> List.first()
    case item do
      nil ->
        0
      item ->
        item.quantity
    end
  end

end
