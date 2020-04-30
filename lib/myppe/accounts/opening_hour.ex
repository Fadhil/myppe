defmodule Myppe.Accounts.OpeningHour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opening_hours" do
    field :day, :integer
    field :end_time, :string
    field :is_open, :boolean, default: false
    field :start_time, :string

    belongs_to :pharmacy, Myppe.Accounts.Pharmacy
    timestamps()
  end

  @doc false
  def changeset(opening_hour, attrs) do
    attrs = attrs |> map_to_opening_hours()
    opening_hour
    |> cast(attrs, [:day, :start_time, :end_time, :is_open])
    |> validate_required([:day, :is_open])
  end

  def map_to_opening_hours(attrs) do
    %{
      "day" => attrs["day"],
      "start_time" => attrs["open"],
      "end_time" => attrs["close"],
      "is_open" => attrs["is_open"]
    }
  end
end
