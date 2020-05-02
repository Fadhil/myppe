defmodule MyppeWeb.ProductView do
  use MyppeWeb, :view
  alias MyppeWeb.ProductView

  def render("index.json", %{products: products}) do
    %{success: true,
      data: render_many(products, ProductView, "product.json")
    }
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      name: product.name,
      code: product.code
    }
  end
end
