defmodule Myppe.Bookings.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pharmacies" do
    field :name, :string

    belongs_to :admin, Myppe.Bookings.Admin
    has_one :inventory, Myppe.Bookings.Inventory
    has_many :stocks, through: [:inventory, :stocks]
    has_many :opening_hours, Myppe.Bookings.OpeningHour

    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
