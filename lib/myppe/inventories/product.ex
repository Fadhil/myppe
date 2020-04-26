defmodule Myppe.Inventories.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
  end
end
