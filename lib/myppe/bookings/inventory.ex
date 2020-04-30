defmodule Myppe.Bookings.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventories" do
    belongs_to :pharmacy, Myppe.Bookings.Pharmacy
    has_many :stocks, Myppe.Bookings.Stock
    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [])
    |> validate_required([])
  end
end
