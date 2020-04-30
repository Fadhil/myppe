defmodule Myppe.Repo.Migrations.AddReferenceToAdminInPharmacies do
  use Ecto.Migration

  def change do
    alter table(:pharmacies) do
      add :admin_id, references(:admins, on_delete: :delete_all)
    end
  end
end
