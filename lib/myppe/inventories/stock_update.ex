defmodule Myppe.Inventories.StockUpdate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stock_updates" do
    field :change, :integer

    belongs_to :stock, Myppe.Inventories.Stock
    timestamps()
  end

  @doc false
  def changeset(stock_update, attrs) do
    stock_update
    |> cast(attrs, [:change, :stock_id])
    |> validate_required([:change, :stock_id])
  end
end
