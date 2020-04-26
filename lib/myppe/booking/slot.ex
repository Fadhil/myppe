defmodule Myppe.Booking.Slot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "slots" do
    field :date, :naive_datetime
    field :slot_id, :integer

    belongs_to :pharmacy, Myppe.Booking.Pharmacy

    timestamps()
  end

  @doc false
  def changeset(slot, attrs) do
    slot
    |> cast(attrs, [:slot_id, :date])
    |> validate_required([:slot_id, :date])
  end
end
