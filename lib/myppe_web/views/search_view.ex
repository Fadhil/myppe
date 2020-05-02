defmodule MyppeWeb.SearchView do
  use MyppeWeb, :view
  alias MyppeWeb.SearchView

  def render("index.json", %{pharmacies: pharmacies}) do
    %{success: true, data: render_many(pharmacies, MyppeWeb.PharmacyView, "pharmacy.json", as: :pharmacy)}
  end
end
