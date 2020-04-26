defmodule Myppe.Repo.Migrations.AddProductIdToLineItems do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    alter table(:line_items) do
      add :product_id, references(:products, on_delete: :nilify_all)
    end
  end
end
