defmodule Myppe.Bookings.LineItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "line_items" do
    field :quantity, :integer

    belongs_to :product, Myppe.Bookings.Product
    belongs_to :booking, Myppe.Bookings.Booking

    timestamps()
  end

  @doc false
  def changeset(line_item, attrs) do
    line_item
    |> cast(attrs, [:quantity, :product_id])
    |> validate_required([:quantity, :product_id])
  end
end
