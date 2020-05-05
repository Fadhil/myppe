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
    |> validate_timeslot_not_full(attrs)
  end

  def update_changeset(user_booking, attrs) do
    user_booking
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end

  @max_bookings_per_timeslot 5

  def max_bookings_per_timeslot do
    @max_bookings_per_timeslot
  end

  def validate_timeslot_not_full(
    changeset, %{"timeslot_id" => timeslot_id}
  ) do
    validate_change(changeset, :timeslot_id, fn (_,_) ->
      timeslot =
        Myppe.Bookings.get_timeslot!(timeslot_id)
        |> Myppe.Repo.preload(:bookings)

      case Enum.count(timeslot.bookings) < @max_bookings_per_timeslot do
        true ->
          []
        false ->
          [timeslot: "Maximum bookings exceeded"]
      end
    end)
  end
end
