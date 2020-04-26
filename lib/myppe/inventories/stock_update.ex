defmodule Myppe.Inventories.StockUpdate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stock_updates" do
    field :change, :integer
    field :stock_id, :id

    timestamps()
  end

  @doc false
  def changeset(stock_update, attrs) do
    stock_update
    |> cast(attrs, [:change])
    |> validate_required([:change])
  end
end
