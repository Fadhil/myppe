defmodule Myppe.Auth.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :email, :string
    field :name, :string
    field :password_hash, :string


    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end

  def registration_changeset(admin, attrs) do
    admin
    |> changeset(attrs)
    |> validate_required([:name])
    |> validate_length(:password, min: 6)
    |> put_password_hash()
  end

  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Argon2.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
