defmodule Myppe.Bookings.ReportedItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reported_items" do
    belongs_to :report, Myppe.Bookings.Report
    belongs_to :product, Myppe.Bookings.Product
    timestamps()
  end

  @doc false
  def changeset(reported_item, attrs) do
    reported_item
    |> cast(attrs, [:product_id])
    |> cast_assoc(:report)
    |> validate_required([:product_id])
  end
end
