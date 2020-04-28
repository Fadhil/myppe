defmodule MyppeWeb.AdminSessionView do
  use MyppeWeb, :view
  alias MyppeWeb.AdminSessionView

  # def render("index.json", %{admin_sessions: admin_sessions}) do
  #   %{data: render_many(admin_sessions, AdminSessionView, "admin_session.json")}
  # end

  def render("show.json", %{admin_session: admin_session}) do
    %{success: true, data: render_one(admin_session, AdminSessionView, "admin_session.json")}
  end

  def render("admin_session.json", %{admin_session: admin_session}) do
    %{token: admin_session.token}
  end
end
