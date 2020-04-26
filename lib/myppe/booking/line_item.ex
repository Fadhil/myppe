defmodule Myppe.Booking.LineItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "line_items" do
    field :price_cents, :integer
    field :quantity, :integer

    belongs_to :product, Myppe.Booking.Product

    timestamps()
  end

  @doc false
  def changeset(line_item, attrs) do
    line_item
    |> cast(attrs, [:quantity, :price_cents])
    |> validate_required([:quantity, :price_cents])
  end
end
