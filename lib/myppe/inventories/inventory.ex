defmodule Myppe.Inventories.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventories" do
    field :pharmacy_id, :id

    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [])
    |> validate_required([])
  end
end
