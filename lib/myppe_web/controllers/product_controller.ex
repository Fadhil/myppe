defmodule MyppeWeb.ProductController do
  use MyppeWeb, :controller

  def index(conn, _params) do
    products = Myppe.Inventories.list_products()

    conn
    |> render("index.json", products: products)
  end
end
