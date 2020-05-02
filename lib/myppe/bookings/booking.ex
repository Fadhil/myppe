defmodule Myppe.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    # Statuses:
    # "new", "declined", "with_errors", "success"
    field :status, :string

    belongs_to :user, Myppe.Bookings.User
    belongs_to :timeslot, Myppe.Bookings.Timeslot
    has_many :line_items, Myppe.Bookings.LineItem

    timestamps()
  end

  @doc false
  def changeset(user_booking, attrs) do
    user_booking
    |> cast(attrs, [:status, :user_id, :timeslot_id])
    |> cast_assoc(:line_items)
    |> validate_required([:status, :user_id, :timeslot_id])
  end
end
