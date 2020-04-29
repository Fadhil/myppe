defmodule Myppe.Repo.Migrations.AddDetailsToPharmacies do
  use Ecto.Migration

  def change do
    alter table(:pharmacies) do
      add :size, :string, null: false
      add :cashier_counter, :integer, null: false
      add :address_line1, :string, null: false
      add :address_line2, :string
      add :postcode, :string, null: false
      add :state, :string, null: false
      add :display_name, :string, null: false
      add :license_number, :string, null: false
      add :is_retail, :boolean, null: false
      add :group, :string, null: false
      add :social_media_whatsapp, :string
      add :social_media_other, :string
      add :social_media_website, :string
    end
  end
end
