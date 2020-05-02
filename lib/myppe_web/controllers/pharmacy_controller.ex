defmodule MyppeWeb.PharmacyController do
  use MyppeWeb, :controller

  alias Myppe.Bookings
  alias Myppe.Bookings.Pharmacy

  action_fallback MyppeWeb.FallbackController

  def index(conn, _params) do
    pharmacies =
      Bookings.list_pharmacies()
      |> Myppe.Repo.preload([stocks: [:product]])
    render(conn, "index.json", pharmacies: pharmacies)
  end

  def create(conn, %{"pharmacy" => pharmacy_params}) do
    with {:ok, %Pharmacy{} = pharmacy} <- Bookings.create_pharmacy(pharmacy_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pharmacy_path(conn, :show, pharmacy))
      |> render("show.json", pharmacy: pharmacy)
    end
  end

  def show(conn, %{"id" => id}) do
    pharmacy =
      Bookings.get_pharmacy!(id)
      |> Myppe.Repo.preload([stocks: [:product]])
    render(conn, "show.json", pharmacy: pharmacy)
  end

  def update(conn, %{"id" => id, "pharmacy" => pharmacy_params}) do
    pharmacy = Bookings.get_pharmacy!(id)

    with {:ok, %Pharmacy{} = pharmacy} <- Bookings.update_pharmacy(pharmacy, pharmacy_params) do
      render(conn, "show.json", pharmacy: pharmacy)
    end
  end

  def delete(conn, %{"id" => id}) do
    pharmacy = Bookings.get_pharmacy!(id)

    with {:ok, %Pharmacy{}} <- Bookings.delete_pharmacy(pharmacy) do
      send_resp(conn, :no_content, "")
    end
  end
end
