defmodule Myppe.Repo.Migrations.CreateReportedItems do
  use Ecto.Migration

  def change do
    create table(:reported_items) do
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:reported_items, [:product_id])
  end
end
