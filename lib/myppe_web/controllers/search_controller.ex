defmodule MyppeWeb.SearchController do
  use MyppeWeb, :controller

  def create(conn, %{"has_products" => products} = _param) do
    pharmacies =
      Myppe.Inventories.list_pharmacies_with_stock(products)
      |> Myppe.Repo.preload([stocks: [:product]])

    conn
    |> put_resp_header("location", Routes.search_path(conn, :index))
    |> render("index.json", pharmacies: pharmacies)
  end
end
