defmodule Myppe.Bookings.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :email, :string
    field :phone, :string
    field :name, :string

    has_one :pharmacy, Myppe.Bookings.Pharmacy

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
