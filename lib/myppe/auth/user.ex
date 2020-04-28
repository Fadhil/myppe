defmodule Myppe.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :id_number, :string
    field :password_hash, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash, :phone, :id_number])
    |> validate_required([:email, :password_hash, :phone, :id_number])
  end
end
