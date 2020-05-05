defmodule MyppeWeb.Admin.AdminView do
  use MyppeWeb, :view
  alias MyppeWeb.Admin.AdminView

  def render("index.json", %{admins: admins}) do
    %{success: true, data: render_many(admins, AdminView, "admin.json")}
  end

  def render("show.json", %{admin: admin}) do
    %{success: true, data: render_one(admin, AdminView, "admin.json")}
  end

  def render("admin.json", %{admin: admin}) do
    %{id: admin.id,
      email: admin.email,
      name: admin.name,
      phone: admin.phone,
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
        opening_hours: Enum.map(admin.pharmacy.opening_hours, &MyppeWeb.AdminSessionView.get_opening_hour_structs/1)
      }
    }
  end
end
