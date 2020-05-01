defmodule MyppeWeb.SearchController do
  use MyppeWeb, :controller

  def create(conn, %{"has_products" => products} = _param) do
    pharmacy_ids =
      Myppe.Inventories.list_pharmacies_with_stock(products)
      |> Enum.map(&(&1.id))
    pharmacies = Myppe.Accounts.list_pharmacies(pharmacy_ids)
    conn
    |> put_resp_header("location", Routes.search_path(conn, :index))
    |> render("index.json", pharmacies: pharmacies)
  end
end
