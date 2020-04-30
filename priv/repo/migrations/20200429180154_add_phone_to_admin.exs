defmodule Myppe.Repo.Migrations.AddPhoneToAdmin do
  use Ecto.Migration

  def change do
    alter table(:admins) do
      add :phone, :string, null: false
    end
  end
end
