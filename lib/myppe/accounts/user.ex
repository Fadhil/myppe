defmodule Myppe.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :id_number, :string
    field :is_malaysian, :boolean
    field :password, :string, virtual: true
    field :password_hash, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :phone, :id_number])
    |> validate_required([:email, :phone, :id_number])
    |> unique_constraint(:email, name: :users_email_index)
    |> unique_constraint(:id_number, name: :users_id_number_index)
    |> unique_constraint(:phone, name: :users_phone_index)
  end

  def registration_changeset(admin, attrs) do
    admin
    |> changeset(attrs)
    |> cast(attrs, [:password])
    |> validate_length(:password, min: 6)
    |> put_password_hash()
  end

  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Argon2.hash_pwd_salt(pass))
      _ ->
        changeset
    end
  end
end
