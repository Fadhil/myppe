defmodule Myppe.Repo.Migrations.CreateLineItems do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:line_items) do
      add :quantity, :integer, null: false
      add :booking_id, references(:bookings, on_delete: :nothing)

      timestamps()
    end

    create index(:line_items, [:booking_id])
  end
end
