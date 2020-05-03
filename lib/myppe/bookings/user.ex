defmodule Myppe.Bookings.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :is_malaysian, :boolean
    field :id_number, :string

    has_many :bookings, Myppe.Bookings.Booking

    timestamps()
  end
end
