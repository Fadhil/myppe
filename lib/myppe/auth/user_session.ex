defmodule Myppe.Auth.UserSession do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_sessions" do
    field :token, :string

    belongs_to :user, Myppe.Auth.User
    timestamps()
  end

  @doc false
  def changeset(user_session, attrs) do
    user_session
    |> cast(attrs, [:user_id])
  end

  def create_changeset(user_session, attrs \\ :empty) do
    user_session
    |> changeset(attrs)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
