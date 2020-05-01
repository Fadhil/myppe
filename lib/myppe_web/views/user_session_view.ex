defmodule MyppeWeb.UserSessionView do
  use MyppeWeb, :view
  alias MyppeWeb.UserSessionView

  # def render("index.json", %{user_sessions: user_sessions}) do
  #   %{data: render_many(user_sessions, UserSessionView, "user_session.json")}
  # end

  def render("show.json", %{user_session: user_session, user: user}) do
    %{success: true, data: render_one(user_session, UserSessionView, "user_session.json", %{user: user})}
  end

  def render("user_session.json", %{user_session: user_session, user: user}) do
    %{token: user_session.token,
      user: %{
        email: user.email,
        id_number: user.id_number,
        is_malaysian: user.is_malaysian,
        phone: user.phone
      }
    }
  end
end
