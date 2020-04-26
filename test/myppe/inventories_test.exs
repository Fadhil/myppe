defmodule Myppe.InventoriesTest do
  use Myppe.DataCase

  alias Myppe.Inventories

  describe "pharmacies" do
    alias Myppe.Inventories.Pharmacy

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def pharmacy_fixture(attrs \\ %{}) do
      {:ok, pharmacy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_pharmacy()

      pharmacy
    end

    test "list_pharmacies/0 returns all pharmacies" do
      pharmacy = pharmacy_fixture()
      assert Inventory.list_pharmacies() == [pharmacy]
    end

    test "get_pharmacy!/1 returns the pharmacy with given id" do
      pharmacy = pharmacy_fixture()
      assert Inventory.get_pharmacy!(pharmacy.id) == pharmacy
    end

    test "create_pharmacy/1 with valid data creates a pharmacy" do
      assert {:ok, %Pharmacy{} = pharmacy} = Inventory.create_pharmacy(@valid_attrs)
      assert pharmacy.name == "some name"
    end

    test "create_pharmacy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_pharmacy(@invalid_attrs)
    end

    test "update_pharmacy/2 with valid data updates the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{} = pharmacy} = Inventory.update_pharmacy(pharmacy, @update_attrs)
      assert pharmacy.name == "some updated name"
    end

    test "update_pharmacy/2 with invalid data returns error changeset" do
      pharmacy = pharmacy_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_pharmacy(pharmacy, @invalid_attrs)
      assert pharmacy == Inventory.get_pharmacy!(pharmacy.id)
    end

    test "delete_pharmacy/1 deletes the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{}} = Inventory.delete_pharmacy(pharmacy)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_pharmacy!(pharmacy.id) end
    end

    test "change_pharmacy/1 returns a pharmacy changeset" do
      pharmacy = pharmacy_fixture()
      assert %Ecto.Changeset{} = Inventory.change_pharmacy(pharmacy)
    end
  end

  describe "inventories" do
    alias Myppe.Inventories.PharmacyInventory

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def pharmacy_inventory_fixture(attrs \\ %{}) do
      {:ok, pharmacy_inventory} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_pharmacy_inventory()

      pharmacy_inventory
    end

    test "list_inventories/0 returns all inventories" do
      pharmacy_inventory = pharmacy_inventory_fixture()
      assert Inventory.list_inventories() == [pharmacy_inventory]
    end

    test "get_pharmacy_inventory!/1 returns the pharmacy_inventory with given id" do
      pharmacy_inventory = pharmacy_inventory_fixture()
      assert Inventory.get_pharmacy_inventory!(pharmacy_inventory.id) == pharmacy_inventory
    end

    test "create_pharmacy_inventory/1 with valid data creates a pharmacy_inventory" do
      assert {:ok, %PharmacyInventory{} = pharmacy_inventory} = Inventory.create_pharmacy_inventory(@valid_attrs)
    end

    test "create_pharmacy_inventory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_pharmacy_inventory(@invalid_attrs)
    end

    test "update_pharmacy_inventory/2 with valid data updates the pharmacy_inventory" do
      pharmacy_inventory = pharmacy_inventory_fixture()
      assert {:ok, %PharmacyInventory{} = pharmacy_inventory} = Inventory.update_pharmacy_inventory(pharmacy_inventory, @update_attrs)
    end

    test "update_pharmacy_inventory/2 with invalid data returns error changeset" do
      pharmacy_inventory = pharmacy_inventory_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_pharmacy_inventory(pharmacy_inventory, @invalid_attrs)
      assert pharmacy_inventory == Inventory.get_pharmacy_inventory!(pharmacy_inventory.id)
    end

    test "delete_pharmacy_inventory/1 deletes the pharmacy_inventory" do
      pharmacy_inventory = pharmacy_inventory_fixture()
      assert {:ok, %PharmacyInventory{}} = Inventory.delete_pharmacy_inventory(pharmacy_inventory)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_pharmacy_inventory!(pharmacy_inventory.id) end
    end

    test "change_pharmacy_inventory/1 returns a pharmacy_inventory changeset" do
      pharmacy_inventory = pharmacy_inventory_fixture()
      assert %Ecto.Changeset{} = Inventory.change_pharmacy_inventory(pharmacy_inventory)
    end
  end

  describe "products" do
    alias Myppe.Inventories.Product

    @valid_attrs %{code: "some code", name: "some name"}
    @update_attrs %{code: "some updated code", name: "some updated name"}
    @invalid_attrs %{code: nil, name: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventory.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventory.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Inventory.create_product(@valid_attrs)
      assert product.code == "some code"
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Inventory.update_product(product, @update_attrs)
      assert product.code == "some updated code"
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product(product, @invalid_attrs)
      assert product == Inventory.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventory.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product(product)
    end
  end

  describe "stocks" do
    alias Myppe.Inventories.Stock

    @valid_attrs %{quantity: 42}
    @update_attrs %{quantity: 43}
    @invalid_attrs %{quantity: nil}

    def stock_fixture(attrs \\ %{}) do
      {:ok, stock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_stock()

      stock
    end

    test "list_stocks/0 returns all stocks" do
      stock = stock_fixture()
      assert Inventory.list_stocks() == [stock]
    end

    test "get_stock!/1 returns the stock with given id" do
      stock = stock_fixture()
      assert Inventory.get_stock!(stock.id) == stock
    end

    test "create_stock/1 with valid data creates a stock" do
      assert {:ok, %Stock{} = stock} = Inventory.create_stock(@valid_attrs)
      assert stock.quantity == 42
    end

    test "create_stock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_stock(@invalid_attrs)
    end

    test "update_stock/2 with valid data updates the stock" do
      stock = stock_fixture()
      assert {:ok, %Stock{} = stock} = Inventory.update_stock(stock, @update_attrs)
      assert stock.quantity == 43
    end

    test "update_stock/2 with invalid data returns error changeset" do
      stock = stock_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_stock(stock, @invalid_attrs)
      assert stock == Inventory.get_stock!(stock.id)
    end

    test "delete_stock/1 deletes the stock" do
      stock = stock_fixture()
      assert {:ok, %Stock{}} = Inventory.delete_stock(stock)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_stock!(stock.id) end
    end

    test "change_stock/1 returns a stock changeset" do
      stock = stock_fixture()
      assert %Ecto.Changeset{} = Inventory.change_stock(stock)
    end
  end

  describe "admins" do
    alias Myppe.Inventories.Admin

    @valid_attrs %{email: "some email", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password_hash: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Inventory.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Inventory.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Inventory.create_admin(@valid_attrs)
      assert admin.email == "some email"
      assert admin.password_hash == "some password_hash"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = Inventory.update_admin(admin, @update_attrs)
      assert admin.email == "some updated email"
      assert admin.password_hash == "some updated password_hash"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_admin(admin, @invalid_attrs)
      assert admin == Inventory.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Inventory.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Inventory.change_admin(admin)
    end
  end

  describe "stock_updates" do
    alias Myppe.Inventories.StockUpdate

    @valid_attrs %{change: 42}
    @update_attrs %{change: 43}
    @invalid_attrs %{change: nil}

    def stock_update_fixture(attrs \\ %{}) do
      {:ok, stock_update} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventories.create_stock_update()

      stock_update
    end

    test "list_stock_updates/0 returns all stock_updates" do
      stock_update = stock_update_fixture()
      assert Inventories.list_stock_updates() == [stock_update]
    end

    test "get_stock_update!/1 returns the stock_update with given id" do
      stock_update = stock_update_fixture()
      assert Inventories.get_stock_update!(stock_update.id) == stock_update
    end

    test "create_stock_update/1 with valid data creates a stock_update" do
      assert {:ok, %StockUpdate{} = stock_update} = Inventories.create_stock_update(@valid_attrs)
      assert stock_update.change == 42
    end

    test "create_stock_update/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventories.create_stock_update(@invalid_attrs)
    end

    test "update_stock_update/2 with valid data updates the stock_update" do
      stock_update = stock_update_fixture()
      assert {:ok, %StockUpdate{} = stock_update} = Inventories.update_stock_update(stock_update, @update_attrs)
      assert stock_update.change == 43
    end

    test "update_stock_update/2 with invalid data returns error changeset" do
      stock_update = stock_update_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventories.update_stock_update(stock_update, @invalid_attrs)
      assert stock_update == Inventories.get_stock_update!(stock_update.id)
    end

    test "delete_stock_update/1 deletes the stock_update" do
      stock_update = stock_update_fixture()
      assert {:ok, %StockUpdate{}} = Inventories.delete_stock_update(stock_update)
      assert_raise Ecto.NoResultsError, fn -> Inventories.get_stock_update!(stock_update.id) end
    end

    test "change_stock_update/1 returns a stock_update changeset" do
      stock_update = stock_update_fixture()
      assert %Ecto.Changeset{} = Inventories.change_stock_update(stock_update)
    end
  end
end
