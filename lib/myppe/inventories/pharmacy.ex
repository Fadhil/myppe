defmodule Myppe.Inventories.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pharmacies" do
    field :name, :string
    field :display_name, :string

    belongs_to :admin, Myppe.Inventories.Admin
    has_one :inventory, Myppe.Inventories.Inventory
    has_many :stocks, through: [:inventory, :stocks]

    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
