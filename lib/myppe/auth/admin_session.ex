defmodule Myppe.Auth.AdminSession do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admin_sessions" do
    field :token, :string

    belongs_to :admin, Myppe.Auth.Admin
    timestamps()
  end

  @doc false
  def changeset(admin_session, attrs) do
    admin_session
    |> cast(attrs, [:admin_id])
  end

  def create_changeset(admin_session, attrs \\ []) do
    admin_session
    |> changeset(attrs)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
