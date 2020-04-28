defmodule Myppe.Repo.Migrations.CreateUserSessions do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:user_sessions) do
      add :token, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_sessions, [:user_id])
    create index(:user_sessions, [:token])
  end
end
