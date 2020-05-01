defmodule Myppe.Repo.Migrations.AddIsMalaysianBooleanToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :is_malaysian, :boolean, null: false, default: true
    end
  end
end
