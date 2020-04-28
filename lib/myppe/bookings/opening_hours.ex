defmodule Myppe.Bookings.OpeningHours do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opening_hours" do
    field :day, :integer
    field :end_time, :string
    field :start_time, :string

    belongs_to :pharmacy, Myppe.Bookings.Pharmacy
    timestamps()
  end

  @doc false
  def changeset(opening_hours, attrs) do
    opening_hours
    |> cast(attrs, [:day, :start_time, :end_time])
    |> validate_required([:day, :start_time, :end_time])
  end
end
