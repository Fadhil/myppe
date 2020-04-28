defmodule MyppeWeb.UserSessionController do
  use MyppeWeb, :controller


  alias Myppe.Auth
  alias Myppe.Auth.User
  alias Myppe.Auth.UserSession

  action_fallback MyppeWeb.FallbackController

  def create(conn, %{"user" => attrs}) do
    user = Auth.get_user_by_email!(attrs["email"])
    case Argon2.check_pass(user, attrs["password"]) do
      {:ok, user} ->
        {:ok, session} = Auth.create_user_session(%{user_id: user.id})
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_session_path(conn, :show, session))
        |> render("show.json", user_session: session)
      {:error, message} ->
        conn
        |> put_status(:unauthorized)
        |> put_view(MyppeWeb.ErrorView)
        |> render("error.json", message: message)
    end
  end

  def show(conn, %{"id" => id}) do
    user_session = Auth.get_user_session!(id)
    render(conn, "show.json", user_session: user_session)
  end

  def update(conn, %{"id" => id, "user_session" => user_session_params}) do
    user_session = Auth.get_user_session!(id)

    with {:ok, %UserSession{} = user_session} <- Auth.update_user_session(user_session, user_session_params) do
      render(conn, "show.json", user_session: user_session)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_session = Auth.get_user_session!(id)

    with {:ok, %UserSession{}} <- Auth.delete_user_session(user_session) do
      send_resp(conn, :no_content, "")
    end
  end
end
