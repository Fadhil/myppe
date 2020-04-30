defmodule Myppe.Accounts.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  @all_registration_fields ~w(pharmacy_type password pharmacy_size
    cashier_counter address_line1 address_line2 post_code state moh_store_name
    moh_license_number moh_is_retail account_display_name account_pharmacy_group
    account_full_name account_phone social_media_whatsapp social_media_other
    social_media_website operating_hours)a

  @required_for_registration ~w(pharmacy_type password pharmacy_size
    cashier_counter address_line1 post_code state moh_store_name
    moh_license_number moh_is_retail account_display_name account_pharmacy_group
    account_full_name account_phone social_media_whatsapp social_media_other
    social_media_website operating_hours
  )a

  @required_attributes ~w(email name password_hash)a
  schema "admins" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :pharmacy_type, :string, virtual: true
    field :pharmacy_size, :string, virtual: true
    field :cashier_counter, :integer, virtual: true
    field :address_line1, :string, virtual: true
    field :address_line2, :string, virtual: true
    field :post_code, :string, virtual: true
    field :state, :string, virtual: true
    field :moh_store_name, :string, virtual: true
    field :moh_license_number, :string, virtual: true
    field :moh_is_retail, :boolean, virtual: true
    field :account_display_name, :string, virtual: true
    field :account_pharmacy_group, :string, virtual: true
    field :account_full_name, :string, virtual: true
    field :account_email, :string, virtual: true
    field :account_phone, :string, virtual: true
    field :social_media_whatsapp, :string, virtual: true
    field :social_media_other, :string, virtual: true
    field :social_media_website, :string, virtual: true
    field :operating_hours, {:array, :map}, virtual: true

    has_one :pharmacy, Myppe.Accounts.Pharmacy

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email, name: :admins_email_index)
  end

  def create_changeset(admin, attrs) do
    admin
    |> cast(attrs, @required_attributes)
    |> cast_assoc(:pharmacy)
    |> validate_required(@required_attributes)
  end

  def registration_changeset(admin, attrs) do
    attrs = attrs |> map_to_admin
    res = admin
    |> changeset(attrs)
    |> cast(attrs, @all_registration_fields)
    |> validate_required(@required_for_registration)
    |> validate_length(:password, min: 6)
    |> put_password_hash()

    res
  end

  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Argon2.hash_pwd_salt(pass))
      _ ->
        changeset
    end
  end

  defp map_to_admin(attrs) do
    %{
      "email" => attrs["account"]["email"],
      "password" => attrs["password"],
      "pharmacy_type" => attrs["pharmacy_type"],
      "pharmacy_size" => attrs["pharmacy_size"],
      "cashier_counter" => attrs["cashier_counter"],
      "address_line1" => attrs["address"]["line1"],
      "address_line2" => attrs["address"]["line2"],
      "post_code" => attrs["address"]["post_code"],
      "state" => attrs["address"]["state"],
      "moh_store_name" => attrs["moh"]["store_name"],
      "moh_license_number" => attrs["moh"]["license_num"],
      "moh_is_retail" => attrs["moh"]["is_retail"],
      "account_display_name" => attrs["account"]["display_name"],
      "account_pharmacy_group" => attrs["account"]["pharmacy_group"],
      "account_full_name" => attrs["account"]["full_name"],
      "account_phone" => attrs["account"]["phone"],
      "social_media_whatsapp" => attrs["social_media"]["whatsapp"],
      "social_media_other" => attrs["social_media"]["other"],
      "social_media_website" => attrs["social_media"]["website"],
      "operating_hours" => attrs["operating_hours"]
    }
  end

  def map_to_nested_admin_attrs(changes) do
    %{
      "email" =>  changes.email,
      "name" => changes.account_full_name,
      "password_hash" => changes.password_hash,
      "pharmacy" => %{
        "address_line1" => changes.address_line1,
        "address_line2" => (if changes.address_line2, do: changes.address_line2, else: ""),
        "cashier_counter" => changes.cashier_counter,
        "display_name" => changes.account_display_name,
        "group" => changes.account_pharmacy_group,
        "is_retail" => changes.moh_is_retail,
        "license_number" => changes.moh_license_number,
        "pharmacy_type" => changes.pharmacy_type,
        "postcode" => changes.post_code,
        "size" => changes.pharmacy_size,
        "social_media_whatsapp" => changes.social_media_whatsapp,
        "social_media_other" => changes.social_media_other,
        "social_media_website" => changes.social_media_website,
        "state" => changes.state,
        "store_name" => changes.moh_store_name,
        "inventory" => %{}
      }
    }
  end
end
