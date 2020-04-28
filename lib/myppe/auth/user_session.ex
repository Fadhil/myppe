defmodule Myppe.Auth.UserSession do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_sessions" do
    field :token, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_session, attrs) do
    user_session
    |> cast(attrs, [:token])
    |> validate_required([:token])
  end
end
