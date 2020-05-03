defmodule MyppeWeb.BookingView do
  use MyppeWeb, :view
  alias MyppeWeb.BookingView

  def render("index.json", %{bookings: bookings}) do
    %{success: true,
      data: render_many(bookings, BookingView, "booking.json")
    }
  end

  def render("show.json", %{booking: booking}) do
    %{success: true,
      data: render_one(booking, BookingView, "booking.json")
    }
  end

  def render("booking.json", %{booking: booking}) do
    %{id: booking.id,
      status: booking.status,
      items: render_many(booking.line_items, BookingView, "line_item.json", as: :line_item)
    }
  end

  def render("line_item.json", %{line_item: line_item})do
    %{
      id: line_item.id,
      name: line_item.product.name,
      quantity: line_item.quantity
    }
  end
end
