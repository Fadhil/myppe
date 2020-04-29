defmodule Myppe.Repo.Migrations.AddFieldsToAdmin do
  use Ecto.Migration

  def change do
    alter table(:admins) do
      add :name, :string
    end
  end
end
