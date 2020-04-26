defmodule Myppe.Bookings.Timeslot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timeslots" do
    field :quarter, :integer

    belongs_to :slot, Myppe.Bookings.Slot

    timestamps()
  end

  @doc false
  def changeset(timeslot, attrs) do
    timeslot
    |> cast(attrs, [:quarter])
    |> validate_required([:quarter])
  end
end
