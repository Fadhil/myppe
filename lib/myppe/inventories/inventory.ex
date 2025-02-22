defmodule Myppe.Inventories.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventories" do
    belongs_to :pharmacy, Myppe.Inventories.Pharmacy
    has_many :stocks, Myppe.Inventories.Stock
    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [])
    |> validate_required([])
  end
end
