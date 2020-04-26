defmodule Myppe.Repo.Migrations.CreateProducts do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  def change do
    create table(:products) do
      add :name, :string

      timestamps()
    end

  end
end
