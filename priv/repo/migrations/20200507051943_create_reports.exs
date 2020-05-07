defmodule Myppe.Repo.Migrations.CreateReports do
  use Ecto.Migration

  def change do
    create table(:reports) do
      add :report_type, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :pharmacy_id, references(:pharmacies, on_delete: :nothing)

      timestamps()
    end

    create index(:reports, [:user_id])
    create index(:reports, [:pharmacy_id])
  end
end
