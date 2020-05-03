defmodule Myppe.Bookings.Slot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "slots" do
    field :date, :naive_datetime
    field :slot_id, :integer

    belongs_to :pharmacy, Myppe.Bookings.Pharmacy
    has_many :timeslots, Myppe.Bookings.Timeslot

    timestamps()
  end

  @doc false
  def changeset(slot, attrs) do
    slot
    |> cast(attrs, [:slot_id, :date, :pharmacy_id])
    |> validate_required([:slot_id, :date])
  end
end
