defmodule Myppe.Repo.Migrations.CreateTimeslots do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:timeslots) do
      add :quarter, :integer, null: false
      add :slot_id, references(:slots, on_delete: :delete_all)

      timestamps()
    end

    create index(:timeslots, [:slot_id])
  end
end
