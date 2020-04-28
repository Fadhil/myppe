defmodule Myppe.Repo.Migrations.CreateAdminSessions do
  use Ecto.Migration

  def change do
    create table(:admin_sessions) do
      add :token, :string
      add :admin_id, references(:admins, on_delete: :nothing)

      timestamps()
    end

    create index(:admin_sessions, [:admin_id])
    create index(:admin_sessions, [:token])
  end
end
