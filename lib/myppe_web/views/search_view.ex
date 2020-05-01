defmodule MyppeWeb.SearchView do
  use MyppeWeb, :view
  alias MyppeWeb.SearchView

  def render("index.json", %{pharmacies: pharmacies}) do
    %{success: true, data: render_many(pharmacies, SearchView, "pharmacy.json", as: :pharmacy)}
  end

  def render("pharmacy.json", %{pharmacy: pharmacy}) do
    %{
      id: pharmacy.id,
      name: pharmacy.display_name,
      address_line1: pharmacy.address_line1,
      address_line2: pharmacy.address_line2,
      cashier_counter: pharmacy.cashier_counter,
      group: pharmacy.group,
      is_retail: pharmacy.is_retail,
      type: pharmacy.pharmacy_type,
      postcode: pharmacy.postcode,
      size: pharmacy.size,
      social_media_other: pharmacy.social_media_other,
      social_media_website: pharmacy.social_media_website,
      social_media_whatsapp: pharmacy.social_media_whatsapp,
      state: pharmacy.state
    }
  end
end
