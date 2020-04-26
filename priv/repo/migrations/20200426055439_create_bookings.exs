defmodule Myppe.Repo.Migrations.CreateBookings do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:bookings) do
      add :status, :string
      add :user_id, references(:users, on_delete: :delete_all)
      add :timeslot_id, references(:timeslots, on_delete: :delete_all)

      timestamps()
    end

    create index(:bookings, [:user_id])
    create index(:bookings, [:timeslot_id])
  end
end
