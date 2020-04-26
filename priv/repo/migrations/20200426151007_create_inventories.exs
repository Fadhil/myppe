defmodule Myppe.Repo.Migrations.CreateInventories do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:inventories) do
      add :pharmacy_id, references(:pharmacies, on_delete: :nothing)

      timestamps()
    end

    create index(:inventories, [:pharmacy_id])
  end
end
