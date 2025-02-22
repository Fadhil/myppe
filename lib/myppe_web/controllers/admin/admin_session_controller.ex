defmodule MyppeWeb.Admin.AdminSessionController do
  use MyppeWeb, :controller

  alias Myppe.Auth
  alias Myppe.Auth.AdminSession

  action_fallback MyppeWeb.FallbackController

  def create(conn, %{"user" => attrs}) do
    admin = Auth.get_admin_by_email!(attrs["email"])
    case Argon2.check_pass(admin, attrs["password"]) do
      {:ok, admin} ->
        {:ok, session} = Auth.create_admin_session(%{admin_id: admin.id})
        admin =
          Myppe.Accounts.get_admin!(admin.id)
          |> Myppe.Repo.preload([pharmacy: [:opening_hours]])
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.admin_session_path(conn, :show, session))
        |> render("show.json", admin_session: session, admin: admin)
      {:error, message} ->
        conn
        |> put_status(:unauthorized)
        |> put_view(MyppeWeb.ErrorView)
        |> render("error.json", message: message)
    end
  end

  def show(conn, %{"id" => id}) do
    admin_session =
      Auth.get_admin_session!(id)
      |> Myppe.Repo.preload(:admin)
    admin =
      Myppe.Accounts.get_admin!(admin_session.admin.id)
      |> Myppe.Repo.preload([pharmacy: [:opening_hours]])
    render(conn, "show.json", admin_session: admin_session, admin: admin)
  end

  def update(conn, %{"id" => id, "admin_session" => admin_session_params}) do
    admin_session = Auth.get_admin_session!(id)

    with {:ok, %AdminSession{} = admin_session} <- Auth.update_admin_session(admin_session, admin_session_params) do
      render(conn, "show.json", admin_session: admin_session)
    end
  end

  def delete(conn, %{"id" => id}) do
    admin_session = Auth.get_admin_session!(id)

    with {:ok, %adminSession{}} <- Auth.delete_admin_session(admin_session) do
      send_resp(conn, :no_content, "")
    end
  end
end
