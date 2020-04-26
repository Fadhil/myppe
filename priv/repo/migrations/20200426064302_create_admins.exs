defmodule Myppe.Repo.Migrations.CreateAdmins do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:admins) do
      add :email, :string, null: false
      add :password_hash, :string, null: false

      timestamps()
    end
    create unique_index(:admins, :email)
  end
end
