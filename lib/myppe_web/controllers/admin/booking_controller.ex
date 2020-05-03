defmodule MyppeWeb.Admin.BookingController do
  use MyppeWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.json", bookings: [])
  end
end
