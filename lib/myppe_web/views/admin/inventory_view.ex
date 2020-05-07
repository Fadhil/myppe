defmodule MyppeWeb.Admin.InventoryView do
  use MyppeWeb, :view
  alias MyppeWeb.Admin.InventoryView

  def render("index.json", %{stocks: stocks}) do
    %{success: true, data: %{inventory: render_many(stocks, InventoryView, "stock.json", as: :stock), series: get_inventory_history(stocks)}}
  end

  def render("stock.json", %{stock: stock}) do
    %{
      id: stock.id,
      name: stock.product.name,
      code: stock.product.code,
      quantity: stock.quantity
    }
  end

  def get_inventory_history(stocks) do
    stocks
    |> Enum.map(fn s ->
      %{
        name: s.product.name,
        data: get_stock_history(s)
      }
    end)
  end

  def get_stock_history(stock) do
    values = []
    values = values ++ [{stock.quantity, stock.updated_at}]
    values =
      stock.stock_updates
      |> Enum.filter(fn x -> Timex.after?(x.inserted_at, Timex.now |> Timex.shift(days: -2)) end)
      |> Enum.sort(fn x,y -> Timex.after?(x.inserted_at, y.inserted_at) end)
      |> Enum.reduce(values, fn s, acc ->
        last_values = List.last(acc)
        last_value = elem(last_values, 0)
        new_value = last_value - s.change
        acc ++ [{new_value, s.inserted_at}]
      end)
      |> Enum.map(fn {q,u} -> [q,u] end)
  end
end

