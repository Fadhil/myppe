defmodule Myppe.Repo.Migrations.CreateStocks do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:stocks) do
      add :quantity, :integer
      add :product_id, references(:products, on_delete: :nothing)
      add :inventory_id, references(:inventories, on_delete: :nothing)

      timestamps()
    end

    create index(:stocks, [:product_id])
    create index(:stocks, [:inventory_id])
  end
end
