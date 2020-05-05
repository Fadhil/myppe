defmodule MyppeWeb.Admin.AdminSessionView do
  use MyppeWeb, :view
  alias MyppeWeb.Admin.AdminSessionView

  # def render("index.json", %{admin_sessions: admin_sessions}) do
  #   %{data: render_many(admin_sessions, AdminSessionView, "admin_session.json")}
  # end

  def render("show.json", %{admin_session: admin_session, admin: admin}) do
    %{success: true, data: render_one(admin_session, AdminSessionView, "admin_session.json", %{admin: admin})}
  end

  def render("admin_session.json", %{admin_session: admin_session, admin: admin}) do
    %{
      token: admin_session.token,
      user: %{
        name: admin.name,
        email: admin.email
      },
      pharmacy: %{
        name: admin.pharmacy.name,
        display_name: admin.pharmacy.display_name,
        line1: admin.pharmacy.address_line1,
        line2: admin.pharmacy.address_line2,
        cashier_counter: admin.pharmacy.cashier_counter,
        group: admin.pharmacy.group,
        is_retail: admin.pharmacy.is_retail,
        license_number: admin.pharmacy.license_number,
        pharmacy_type: admin.pharmacy.pharmacy_type,
        postcode: admin.pharmacy.postcode,
        size: admin.pharmacy.size,
        social_media_other: admin.pharmacy.social_media_other,
        social_media_website: admin.pharmacy.social_media_website,
        social_media_whatsapp: admin.pharmacy.social_media_other,
        state: admin.pharmacy.state,
        opening_hours: Enum.map(admin.pharmacy.opening_hours, &get_opening_hour_structs/1),
        updated_at: get_last_inventory_update(admin.pharmacy)
      }
    }
  end

  def get_opening_hour_structs(opening_hour) do
    opening_hour
    |> Map.delete(:__meta__)
    |> Map.delete(:pharmacy)
    |> Map.from_struct
  end

  def get_last_inventory_update(pharmacy) do
    pharmacy =
      Myppe.Inventories.get_pharmacy!(pharmacy.id)
      |> Myppe.Repo.preload(:stock_updates)
    case pharmacy.stock_updates do
      [] ->
        nil
      stock_updates ->
        stock_updates
        |> Enum.sort(fn x,y -> Timex.after?(x.inserted_at, y.inserted_at) end)
        |> List.first()
        |> Map.get(:inserted_at)
    end

  end
end
