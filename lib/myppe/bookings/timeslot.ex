defmodule Myppe.Bookings.Timeslot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timeslots" do
    field :quarter, :integer

    belongs_to :slot, Myppe.Bookings.Slot
    has_many :bookings, Myppe.Bookings.Booking

    timestamps()
  end

  @doc false
  def changeset(timeslot, attrs) do
    timeslot
    |> cast(attrs, [:quarter, :slot_id])
    |> validate_required([:quarter, :slot_id])
  end
end
