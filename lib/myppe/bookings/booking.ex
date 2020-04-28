defmodule Myppe.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :status, :string

    belongs_to :user, Myppe.Bookings.User
    belongs_to :timeslot, Myppe.Bookings.Timeslot

    timestamps()
  end

  @doc false
  def changeset(user_booking, attrs) do
    user_booking
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end
end
