defmodule Myppe.Inventories.Stock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stocks" do
    field :quantity, :integer

    belongs_to :inventory, Myppe.Inventories.Inventory
    belongs_to :product, Myppe.Inventories.Product
    timestamps()
  end

  @doc false
  def changeset(stock, attrs) do
    stock
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
