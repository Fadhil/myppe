defmodule Myppe.Inventories.Stock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stocks" do
    field :quantity, :integer

    belongs_to :inventory, Myppe.Inventories.Inventory
    belongs_to :product, Myppe.Inventories.Product

    has_many :stock_updates, Myppe.Inventories.StockUpdate
    timestamps()
  end

  @doc false
  def changeset(stock, attrs) do
    stock
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
    |> validate_quantity_is_positive(:quantity, attrs["change"])
  end

  def create_changeset(stock, attrs) do
    stock
    |> cast(attrs, [:quantity, :inventory_id, :product_id])
    |> validate_required([:quantity, :inventory_id, :product_id])
  end

  def validate_quantity_is_positive(changeset, field, change) when is_atom(field) do
    validate_change(changeset, field, fn (current_field, value) ->
      if value < 0 do
        [{field, "Stock cannot be negative"}]
      else
        []
      end
    end)
  end
end
