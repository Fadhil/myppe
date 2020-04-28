defmodule Myppe.Auth.Plugs.AuthenticateAdmin do
  @moduledoc ~S"""
  This module is a plug that adds a current admin if there is a session with a
  udser_id in it. Assigns `nil` if no admin is found
  """
  import Plug.Conn

  alias Myppe.Auth.Admin
  alias Myppe.Auth.AdminSession
  def init(default), do: default

  def call(conn, _default) do
    case Myppe.Auth.get_admin_session(conn) do
      {:ok, session} ->
          authorized(conn, session.admin)
      _ ->
        unauthorized(conn)
    end
  end

  defp authorized(conn, admin) do
    conn
    |> assign(:signed_in, true)
    |> assign(:current_admin, admin)
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
