defmodule MyppeWeb.Admin.InventoryController do
  use MyppeWeb, :controller

  def index(conn, _params) do
    pharmacy = Myppe.Inventories.get_pharmacy_for_user(conn.assigns.current_admin)
    stocks =
      Myppe.Inventories.list_stocks(pharmacy)
      |> Myppe.Repo.preload(:product)
    conn
    |> render(:index, stocks: stocks)
  end

  def update(conn, %{"changes" => changes} = _params) do
    pharmacy = Myppe.Inventories.get_pharmacy_for_user(conn.assigns.current_admin)
    res = pharmacy
    |> Myppe.Inventories.update_and_record_stock_changes(changes)
    case res do
      {:ok, _} ->
        stocks =
          Myppe.Inventories.list_stocks(pharmacy)
          |>Myppe.Repo.preload(:product)
        conn
        |> render(:index, stocks: stocks)
      {:error, _, {:error, cs}, _} ->
        if cs.errors[:quantity] == {"Stock cannot be negative", []} do
          conn
          |> put_view(MyppeWeb.ErrorView)
          |> render("error.json", message: "Stock cannot be negative")
        else
          conn
          |> put_view(MyppeWeb.ErrorView)
          |> render("error.json", message: "Something went wrong")
        end
    end
  end
end
