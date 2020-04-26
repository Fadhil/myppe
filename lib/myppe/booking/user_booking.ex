defmodule Myppe.Booking.UserBooking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :status, :string
    field :timeslot_id, :id

    belongs_to :user, Myppe.Booking.User
    belongs_to :timeslow, Myppe.Booking.Timeslot

    timestamps()
  end

  @doc false
  def changeset(user_booking, attrs) do
    user_booking
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end
end
