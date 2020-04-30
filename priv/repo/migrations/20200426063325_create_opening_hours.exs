defmodule Myppe.Repo.Migrations.CreateOpeningHours do
  use Ecto.Migration

  def change do
    create table(:opening_hours) do
      add :day, :integer, null: false
      add :start_time, :string
      add :end_time, :string
      add :pharmacy_id, references(:pharmacies, on_delete: :nothing)

      timestamps()
    end

    create index(:opening_hours, [:pharmacy_id])
    create unique_index(:opening_hours, [:day, :pharmacy_id])
  end
end
