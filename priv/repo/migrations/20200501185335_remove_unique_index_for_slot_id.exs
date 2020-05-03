defmodule Myppe.Repo.Migrations.RemoveUniqueIndexForSlotId do
  use Ecto.Migration

  def change do
    drop index(:slots, [:slot_id])
    drop index(:timeslots, [:slot_id, :quarter])
    create index(:slots, :slot_id)
    create unique_index(:slots, [:pharmacy_id, :slot_id])
    create unique_index(:timeslots, [:slot_id, :quarter])
  end
end
