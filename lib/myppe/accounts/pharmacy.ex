defmodule Myppe.Accounts.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset

  @all_attributes [:size, :cashier_counter, :address_line1, :address_line2, :postcode, :state, :store_name, :display_name, :license_number, :is_retail, :group, :social_media_whatsapp, :social_media_other, :social_media_website]

  @required_attributes [:size, :cashier_counter, :address_line1, :postcode, :state, :store_name, :display_name, :license_number, :is_retail, :group]

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
    field :store_name, :string

    belongs_to :admin, Myppe.Accounts.Admin
    has_one :inventory, Myppe.Accounts.Inventory

    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, @all_attributes)
    |> cast_assoc(:inventory)
    |> validate_required(@required_attributes)
  end
end
