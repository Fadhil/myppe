defmodule Myppe.Repo.Migrations.CreateStockUpdates do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:stock_updates) do
      add :change, :integer
      add :stock_id, references(:stocks, on_delete: :nothing)

      timestamps()
    end

    create index(:stock_updates, [:stock_id])
  end
end
