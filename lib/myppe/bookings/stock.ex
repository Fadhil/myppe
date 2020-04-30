defmodule Myppe.Bookings.Stock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stocks" do
    field :quantity, :integer
    field :product_id, :id

    belongs_to :inventory, Myppe.Bookings.Inventory
    timestamps()
  end

  @doc false
  def changeset(stock, attrs) do
    stock
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
