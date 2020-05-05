defmodule Myppe.Inventories.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :code, :string
    field :name, :string
    field :image_url, :string
    field :color, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :code, :image_url, :color])
    |> validate_required([:name, :code])
  end
end
