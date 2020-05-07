defmodule MyppeWeb.ReportController do
  use MyppeWeb, :controller

  def create(conn, params) do
    case Myppe.Bookings.create_report(params) do
      {:ok, report} ->
        conn
        |> json(%{success: true, message: "Report sent"})
      {:error, cs} ->
        conn
        |> put_view(MyppeWeb.ChangesetView)
        |> render("error.json", changeset: cs)
    end
  end
end
