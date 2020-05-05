defmodule Myppe.Repo.Migrations.AddImageAndColorToProduct do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :image_url, :string
      add :color, :string
    end
  end
end
