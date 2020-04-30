defmodule Myppe.Repo.Migrations.AddPharmacyTypeToPharmacies do
  use Ecto.Migration

  def change do
    alter table(:pharmacies) do
      add :pharmacy_type, :string, null: false
    end
  end
end
