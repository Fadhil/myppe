defmodule Myppe.Repo.Migrations.AddIsOpenToOpeningHours do
  use Ecto.Migration

  def change do
    alter table(:opening_hours) do
      add :is_open, :boolean, default: false, null: false
    end

  end
end
