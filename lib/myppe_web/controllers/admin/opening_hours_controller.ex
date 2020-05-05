defmodule MyppeWeb.Admin.OpeningHoursController do
  use MyppeWeb, :controller

  def update(conn, params) do
    admin =
      Myppe.Accounts.get_admin!(conn.assigns.current_admin.id)
      |> Myppe.Repo.preload([pharmacy: [:opening_hours]])
    for oh <- params["operating_hours"] do
      [opening_hour] =
        admin.pharmacy.opening_hours
        |> Enum.filter(fn o -> o.day == oh["day"] end)
      Myppe.Accounts.update_opening_hour(opening_hour, oh)
    end

    admin =
      Myppe.Accounts.get_admin!(conn.assigns.current_admin.id)
      |> Myppe.Repo.preload([pharmacy: [:opening_hours]])
    conn
    |> put_resp_header("location", Routes.admin_path(conn, :show, admin.id))
    |> put_view(MyppeWeb.Admin.AdminView)
    |> render(:show, admin: admin)
  end
end
