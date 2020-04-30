defmodule Myppe.Inventories do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias Ecto.Multi
  alias Myppe.Repo

  alias Myppe.Inventories.Pharmacy

  @doc """
  Returns the list of pharmacies.

  ## Examples

      iex> list_pharmacies()
      [%Pharmacy{}, ...]

  """
  def list_pharmacies do
    Repo.all(Pharmacy)
  end

  @doc """
  Gets a single pharmacy.

  Raises `Ecto.NoResultsError` if the Pharmacy does not exist.

  ## Examples

      iex> get_pharmacy!(123)
      %Pharmacy{}

      iex> get_pharmacy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pharmacy!(id), do: Repo.get!(Pharmacy, id)

  @doc """
  Gets the pharmacy for a given admin user
  """
  def get_pharmacy_for_user(admin) do
    get_pharmacy_for_user_query(admin)
    |> Myppe.Repo.one()
  end

  @doc """
  Returns a query that gets the pharmacy for a given admin user
  """
  def get_pharmacy_for_user_query(admin) do
    from p in Myppe.Inventories.Pharmacy,
      join: a in assoc(p, :admin),
      where: a.id == ^admin.id
  end

  @doc """
  Creates a pharmacy.

  ## Examples

      iex> create_pharmacy(%{field: value})
      {:ok, %Pharmacy{}}

      iex> create_pharmacy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pharmacy(attrs \\ %{}) do
    %Pharmacy{}
    |> Pharmacy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pharmacy.

  ## Examples

      iex> update_pharmacy(pharmacy, %{field: new_value})
      {:ok, %Pharmacy{}}

      iex> update_pharmacy(pharmacy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pharmacy(%Pharmacy{} = pharmacy, attrs) do
    pharmacy
    |> Pharmacy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pharmacy.

  ## Examples

      iex> delete_pharmacy(pharmacy)
      {:ok, %Pharmacy{}}

      iex> delete_pharmacy(pharmacy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pharmacy(%Pharmacy{} = pharmacy) do
    Repo.delete(pharmacy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pharmacy changes.

  ## Examples

      iex> change_pharmacy(pharmacy)
      %Ecto.Changeset{source: %Pharmacy{}}

  """
  def change_pharmacy(%Pharmacy{} = pharmacy) do
    Pharmacy.changeset(pharmacy, %{})
  end

  alias Myppe.Inventories.Inventory

  @doc """
  Returns the list of inventories.

  ## Examples

      iex> list_inventories()
      [%Inventory{}, ...]

  """
  def list_inventories do
    Repo.all(Inventory)
  end

  @doc """
  Gets a single inventory.

  Raises `Ecto.NoResultsError` if the Pharmacy inventory does not exist.

  ## Examples

      iex> get_inventory!(123)
      %Inventory{}

      iex> get_inventory!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inventory!(id), do: Repo.get!(Inventory, id)

  @doc """
  Creates a inventory.

  ## Examples

      iex> create_inventory(%{field: value})
      {:ok, %Inventory{}}

      iex> create_inventory(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inventory(attrs \\ %{}) do
    %Inventory{}
    |> Inventory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inventory.

  ## Examples

      iex> update_inventory(inventory, %{field: new_value})
      {:ok, %Inventory{}}

      iex> update_inventory(inventory, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inventory(%Inventory{} = inventory, attrs) do
    inventory
    |> Inventory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inventory.

  ## Examples

      iex> delete_inventory(inventory)
      {:ok, %Inventory{}}

      iex> delete_inventory(inventory)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inventory(%Inventory{} = inventory) do
    Repo.delete(inventory)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inventory changes.

  ## Examples

      iex> change_inventory(inventory)
      %Ecto.Changeset{source: %Inventory{}}

  """
  def change_inventory(%Inventory{} = inventory) do
    Inventory.changeset(inventory, %{})
  end

  alias Myppe.Inventories.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Gets a product by its code

  ## Examples

      iex> get_product_by_code(:three_ply)
      %Product{}

      iex> get_product!(:none_existent)
      nil
  """
  def get_product_by_code(code) do
    Repo.get_by(Product, code: code)
  end

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{source: %Product{}}

  """
  def change_product(%Product{} = product) do
    Product.changeset(product, %{})
  end

  alias Myppe.Inventories.Stock

  @doc """
  Returns the list of stocks.

  ## Examples

      iex> list_stocks()
      [%Stock{}, ...]

  """
  def list_stocks do
    Repo.all(Stock)
  end

  @doc """
  Lists stocks for a given pharmacy
  """
  def list_stocks(%{id: id} = _pharmacy) do
    list_stocks_query(id)
    |> Myppe.Repo.all
  end

  @doc """
  Returns a query to list all stocks for a pharmacy
  """
  def list_stocks_query(pharmacy_id) do
    from s in Myppe.Inventories.Stock,
      join: i in assoc(s, :inventory),
      join: p in assoc(i, :pharmacy),
      where: p.id == ^pharmacy_id
  end


  @doc """
  Gets a single stock.

  Raises `Ecto.NoResultsError` if the Stock does not exist.

  ## Examples

      iex> get_stock!(123)
      %Stock{}

      iex> get_stock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stock!(id), do: Repo.get!(Stock, id)

  @doc """
  Gets stock for a specific product from pharmacy's inventory
  """
  def get_stock(pharmacy, product) do
    get_stock_query(pharmacy, product)
    |> Myppe.Repo.one
  end

  @doc """
  Returns a query that gets stock for a specific product from pharmacy's inventory
  """
  def get_stock_query(pharmacy, product) do
    from s in Myppe.Inventories.Stock,
      join: i in assoc(s, :inventory),
      join: ph in assoc(i, :pharmacy),
      join: p in assoc(s, :product),
      where: ph.id == ^pharmacy.id,
      where: p.id == ^product.id
  end

  @doc """
  Creates a stock.

  ## Examples

      iex> create_stock(%{field: value})
      {:ok, %Stock{}}

      iex> create_stock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stock(attrs \\ %{}) do
    %Stock{}
    |> Stock.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stock.

  ## Examples

      iex> update_stock(stock, %{field: new_value})
      {:ok, %Stock{}}

      iex> update_stock(stock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stock(%Stock{} = stock, attrs) do
    stock
    |> Stock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a stock's quantity based on changes given and create a stock_update
  to record the change. The two inserts should be transactional and only
  succeed if both do
  """
  def update_and_record_stock_changes(%Pharmacy{} = pharmacy, changes) do
    Enum.reduce(changes, Multi.new(), fn change, multi ->
      Multi.run(
        multi,
        {:changes, change["code"]},
        fn repo, _c ->
          update_and_record_stock_change(pharmacy, change)
        end
      )
    end)
    |> Myppe.Repo.transaction()
  end

  @doc """
  Updates a stocks quantity and records the changes in a Multi
  """
  def update_and_record_stock_change(pharmacy, change) do
    product = get_product_by_code(change["code"])
    stock = get_stock(pharmacy, product)
    quantity = change["change"]

    with {:ok, stock} <- update_stock(stock, %{quantity: stock.quantity + quantity}),
         {:ok, _stock_update} <- create_stock_update(%{change: quantity, stock_id: stock.id}) do
      {:ok, stock}
    else
      err ->
        {:error, err}
     end
  end

  @doc """
  Deletes a stock.

  ## Examples

      iex> delete_stock(stock)
      {:ok, %Stock{}}

      iex> delete_stock(stock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stock(%Stock{} = stock) do
    Repo.delete(stock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stock changes.

  ## Examples

      iex> change_stock(stock)
      %Ecto.Changeset{source: %Stock{}}

  """
  def change_stock(%Stock{} = stock) do
    Stock.changeset(stock, %{})
  end

  alias Myppe.Inventories.Admin

  @doc """
  Returns the list of admins.

  ## Examples

      iex> list_admins()
      [%Admin{}, ...]

  """
  def list_admins do
    Repo.all(Admin)
  end

  @doc """
  Gets a single admin.

  Raises `Ecto.NoResultsError` if the Admin does not exist.

  ## Examples

      iex> get_admin!(123)
      %Admin{}

      iex> get_admin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_admin!(id), do: Repo.get!(Admin, id)

  @doc """
  Creates a admin.

  ## Examples

      iex> create_admin(%{field: value})
      {:ok, %Admin{}}

      iex> create_admin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_admin(attrs \\ %{}) do
    %Admin{}
    |> Admin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a admin.

  ## Examples

      iex> update_admin(admin, %{field: new_value})
      {:ok, %Admin{}}

      iex> update_admin(admin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_admin(%Admin{} = admin, attrs) do
    admin
    |> Admin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a admin.

  ## Examples

      iex> delete_admin(admin)
      {:ok, %Admin{}}

      iex> delete_admin(admin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_admin(%Admin{} = admin) do
    Repo.delete(admin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking admin changes.

  ## Examples

      iex> change_admin(admin)
      %Ecto.Changeset{source: %Admin{}}

  """
  def change_admin(%Admin{} = admin) do
    Admin.changeset(admin, %{})
  end

  alias Myppe.Inventories.StockUpdate

  @doc """
  Returns the list of stock_updates.

  ## Examples

      iex> list_stock_updates()
      [%StockUpdate{}, ...]

  """
  def list_stock_updates do
    Repo.all(StockUpdate)
  end

  @doc """
  Gets a single stock_update.

  Raises `Ecto.NoResultsError` if the Stock update does not exist.

  ## Examples

      iex> get_stock_update!(123)
      %StockUpdate{}

      iex> get_stock_update!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stock_update!(id), do: Repo.get!(StockUpdate, id)

  @doc """
  Creates a stock_update.

  ## Examples

      iex> create_stock_update(%{field: value})
      {:ok, %StockUpdate{}}

      iex> create_stock_update(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stock_update(attrs \\ %{}) do
    %StockUpdate{}
    |> StockUpdate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stock_update.

  ## Examples

      iex> update_stock_update(stock_update, %{field: new_value})
      {:ok, %StockUpdate{}}

      iex> update_stock_update(stock_update, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stock_update(%StockUpdate{} = stock_update, attrs) do
    stock_update
    |> StockUpdate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stock_update.

  ## Examples

      iex> delete_stock_update(stock_update)
      {:ok, %StockUpdate{}}

      iex> delete_stock_update(stock_update)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stock_update(%StockUpdate{} = stock_update) do
    Repo.delete(stock_update)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stock_update changes.

  ## Examples

      iex> change_stock_update(stock_update)
      %Ecto.Changeset{source: %StockUpdate{}}

  """
  def change_stock_update(%StockUpdate{} = stock_update) do
    StockUpdate.changeset(stock_update, %{})
  end

  @doc """
  This initialises a set of 4 PPE items as products
  """
  def initialise_basic_products do
    products = [
      %{name: "3 Ply", code: "three_ply"},
      %{name: "N95 Mask", code: "n95"},
      %{name: "Hand Sanitizer", code: "sanitizer"},
      %{name: "Gloves", code: "gloves"},
    ]

    IO.puts "Creating products\n"
    products
    |> Enum.each(fn p -> create_or_update_product(p) end)
    IO.puts "Successfully created Products\n"
  end

  defp create_or_update_product(attrs) do
    product = Myppe.Inventories.get_product_by_code(attrs.code)
    case product do
      nil ->
        Myppe.Inventories.create_product(attrs)
      product ->
        Myppe.Inventories.update_product(%{name: attrs.name})
    end
  end

  def initialise_inventory(admin_id) do
    admin =
      Myppe.Inventories.get_admin!(admin_id)
      |> Myppe.Repo.preload([pharmacy: [inventory: [:stocks]]])
    products = Myppe.Inventories.list_products()
    products
    |> Enum.each(fn p ->
      case get_stock(admin.pharmacy, p) do
        nil ->
          IO.puts "Adding #{p.name} to #{admin.pharmacy.display_name}'s inventory'"
          create_stock(%{
            quantity: 0,
            product_id: p.id,
            inventory_id: admin.pharmacy.id
          })
        _stock ->
          IO.puts "#{p.name} already in initialised in #{admin.pharmacy.display_name}"
      end
    end)
    {:ok, :initialised_products}
  end
end
