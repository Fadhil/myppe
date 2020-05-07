defmodule Myppe.Repo.Migrations.AddReportIdToReportedItems do
  use Ecto.Migration

  def change do
    alter table(:reported_items) do
      add :report_id, references(:reports, on_delete: :delete_all), null: false
    end
  end
end
