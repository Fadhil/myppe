defmodule Myppe.Bookings.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :code, :string
    field :image_url, :string
    field :color, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
