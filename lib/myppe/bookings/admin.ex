defmodule Myppe.Bookings.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :email, :string
    field :phone, :string
    field :name, :string

    has_one :pharmacy, Myppe.Bookings.Pharmacy
    has_many :slots, through: [:pharmacy, :slots]
    has_many :timeslots, through: [:slots, :timeslots]
    has_many :bookings, through: [:timeslots, :bookings]

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
