defmodule Myppe.Bookings.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pharmacies" do
    field :address_line1, :string
    field :address_line2, :string
    field :cashier_counter, :integer
    field :display_name, :string
    field :group, :string
    field :is_retail, :boolean, default: false
    field :license_number, :string
    field :pharmacy_type, :string
    field :postcode, :string
    field :size, :string
    field :social_media_other, :string
    field :social_media_website, :string
    field :social_media_whatsapp, :string
    field :state, :string
    field :name, :string


    belongs_to :admin, Myppe.Bookings.Admin
    has_one :inventory, Myppe.Bookings.Inventory
    has_many :stocks, through: [:inventory, :stocks]
    has_many :opening_hours, Myppe.Bookings.OpeningHour
    has_many :slots, Myppe.Bookings.Slot
    has_many :timeslots, through: [:slots, :timeslots]
    has_many :bookings, through: [:timeslots, :bookings]

    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
