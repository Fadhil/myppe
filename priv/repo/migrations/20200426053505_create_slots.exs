defmodule Myppe.Repo.Migrations.CreateSlots do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:slots) do
      add :slot_id, :integer, null: false
      add :date, :utc_datetime
      add :pharmacy_id, references(:pharmacies, on_delete: :delete_all)

      timestamps()
    end
    create unique_index(:slots, :slot_id)
  end
end
