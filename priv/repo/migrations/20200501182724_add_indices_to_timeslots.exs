defmodule Myppe.Repo.Migrations.AddIndicesToTimeslots do
  use Ecto.Migration

  def change do
    create index(:timeslots, [:quarter])
    create unique_index(:timeslots, [:slot_id, :quarter])
  end
end
