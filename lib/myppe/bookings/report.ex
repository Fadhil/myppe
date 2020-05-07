defmodule Myppe.Bookings.Report do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reports" do
    field :report_type, :integer
    field :user_id, :id
    field :pharmacy_id, :id

    has_many :reported_items, Myppe.Bookings.ReportedItem

    timestamps()
  end

  @doc false
  def changeset(report, attrs) do
    report
    |> cast(attrs, [:report_type, :user_id, :pharmacy_id])
    |> cast_assoc(:reported_items)
    |> validate_required([:report_type, :user_id, :pharmacy_id])
  end
end
