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
end
