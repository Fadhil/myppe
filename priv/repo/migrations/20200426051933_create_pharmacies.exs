defmodule Myppe.Repo.Migrations.CreatePharmacies do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:pharmacies) do
      add :name, :string

      timestamps()
    end

  end
end
