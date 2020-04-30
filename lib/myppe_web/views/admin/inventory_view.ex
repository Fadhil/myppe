defmodule MyppeWeb.Admin.InventoryView do
  use MyppeWeb, :view
  alias MyppeWeb.Admin.InventoryView

  def render("index.json", %{stocks: stocks}) do
    %{success: true, data: render_many(stocks, InventoryView, "stock.json", as: :stock)}
  end

  def render("stock.json", %{stock: stock}) do
    %{
      id: stock.id,
      name: stock.product.name,
      code: stock.product.code,
      quantity: stock.quantity
    }
  end
end

