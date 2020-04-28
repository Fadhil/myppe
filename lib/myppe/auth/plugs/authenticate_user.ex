
defmodule Myppe.Auth.Plugs.AuthenticateUser do
  @moduledoc ~S"""
  This module is a plug that adds a current user if there is a session with a
  udser_id in it. Assigns `nil` if no user is found
  """
  import Plug.Conn

  alias Myppe.Auth.User
  alias Myppe.Auth.UserSession
  def init(default), do: default

  def call(conn, _default) do
    case Myppe.Auth.get_user_session(conn) do
      {:ok, session} ->
          authorized(conn, session.user)
      _ ->
        unauthorized(conn)
    end
  end

  defp authorized(conn, user) do
    conn
    |> assign(:signed_in, true)
    |> assign(:current_user, user)
  end

  defp unauthorized(conn) do
    conn
    |> put_status(401)
    |> Phoenix.Controller.json(%{
      success: false,
      message: "Unauthorized"
    })
    |> halt()
  end
end
