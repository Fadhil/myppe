defmodule Myppe.Accounts.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventories" do
    belongs_to :pharmacy, Myppe.Accounts.Pharmacy

    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [])
    |> validate_required([])
  end
end
