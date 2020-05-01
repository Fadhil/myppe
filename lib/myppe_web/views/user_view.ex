defmodule MyppeWeb.UserView do
  use MyppeWeb, :view
  alias MyppeWeb.UserView

  def render("index.json", %{users: users}) do
    %{success: true, data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{success: true, data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      phone: user.phone,
      id_number: user.id_number,
      is_malaysian: user.is_malaysian
    }
  end
end
