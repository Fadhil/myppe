defmodule MyppeWeb.Admin.AdminController do
  use MyppeWeb, :controller

  alias Myppe.Accounts
  alias Myppe.Accounts.Admin

  action_fallback MyppeWeb.FallbackController

  def index(conn, _params) do
    admins = Accounts.list_admins()
    render(conn, "index.json", admins: admins)
  end

  def create(conn, admin_params) do
    with {:ok, %Admin{} = admin} <- Accounts.create_admin(admin_params),
         {:ok, :initialised_products} <- Myppe.Inventories.initialise_inventory(admin.id)
    do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.admin_path(conn, :show, admin))
      |> render("show.json", admin: admin)
    end
  end

  def show(conn, %{"id" => id}) do
    admin = Accounts.get_admin!(id)
    render(conn, "show.json", admin: admin)
  end

  def update(conn, %{"id" => id} = admin_params) do
    admin = Accounts.get_admin!(id)

    with {:ok, %Admin{} = admin} <- Accounts.update_admin(admin, admin_params) do
      admin =
        admin
        |> Myppe.Repo.preload([pharmacy: [:opening_hours]])
      conn
      |> put_status(:accepted)
      |> render("show.json", admin: admin)
    else
      {:error, cs} ->
        conn
        |> put_status(:bad_request)
        |> put_view(MyppeWeb.ChangesetView)
        |> render("error.json", changeset: cs)
    end
  end

  def delete(conn, %{"id" => id}) do
    admin = Accounts.get_admin!(id)

    with {:ok, %Admin{}} <- Accounts.delete_admin(admin) do
      send_resp(conn, :no_content, "")
    end
  end
end
