defmodule Myppe.Repo.Migrations.AddFieldsToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :id_number, :string, null: false
      add :phone, :string, null: false
    end

    create unique_index(:users, [:id_number])
    create unique_index(:users, [:phone])
  end
end
