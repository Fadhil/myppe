defmodule Myppe.Inventories.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :email, :string

    has_one :pharmacy, Myppe.Inventories.Pharmacy

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
