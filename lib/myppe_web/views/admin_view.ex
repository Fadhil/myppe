defmodule MyppeWeb.AdminView do
  use MyppeWeb, :view
  alias MyppeWeb.AdminView

  def render("index.json", %{admins: admins}) do
    %{success: true, data: render_many(admins, AdminView, "admin.json")}
  end

  def render("show.json", %{admin: admin}) do
    %{success: true, data: render_one(admin, AdminView, "admin.json")}
  end

  def render("admin.json", %{admin: admin}) do
    %{id: admin.id,
      email: admin.email}
  end
end
