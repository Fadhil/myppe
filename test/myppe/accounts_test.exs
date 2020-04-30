defmodule Myppe.AccountsTest do
  use Myppe.DataCase

  alias Myppe.Accounts

  describe "users" do
    alias Myppe.Accounts.User

    @valid_attrs %{email: "some email", id_number: "some id_number", password: "some password", phone: "some phone"}
    @update_attrs %{email: "some updated email", id_number: "some updated id_number", password: "some updated password", phone: "some updated phone"}
    @invalid_attrs %{email: nil, id_number: nil, password: nil, phone: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.id_number == "some id_number"
      assert user.password == "some password"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.id_number == "some updated id_number"
      assert user.password == "some updated password"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "admins" do
    alias Myppe.Accounts.Admin

    @valid_attrs %{email: "some email", password: "some password", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password: "some updated password", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password: nil, password_hash: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Accounts.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Accounts.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Accounts.create_admin(@valid_attrs)
      assert admin.email == "some email"
      assert admin.password == "some password"
      assert admin.password_hash == "some password_hash"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = Accounts.update_admin(admin, @update_attrs)
      assert admin.email == "some updated email"
      assert admin.password == "some updated password"
      assert admin.password_hash == "some updated password_hash"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_admin(admin, @invalid_attrs)
      assert admin == Accounts.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Accounts.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Accounts.change_admin(admin)
    end
  end

  describe "pharmacies" do
    alias Myppe.Accounts.Pharmacy

    @valid_attrs %{address_line1: "some address_line1", address_line2: "some address_line2", cashier_counter: 42, display_name: "some display_name", group: "some group", is_retail: true, license_number: "some license_number", postcode: "some postcode", size: "some size", social_media_other: "some social_media_other", social_media_website: "some social_media_website", social_media_whatsapp: "some social_media_whatsapp", state: "some state", store_name: "some store_name"}
    @update_attrs %{address_line1: "some updated address_line1", address_line2: "some updated address_line2", cashier_counter: 43, display_name: "some updated display_name", group: "some updated group", is_retail: false, license_number: "some updated license_number", postcode: "some updated postcode", size: "some updated size", social_media_other: "some updated social_media_other", social_media_website: "some updated social_media_website", social_media_whatsapp: "some updated social_media_whatsapp", state: "some updated state", store_name: "some updated store_name"}
    @invalid_attrs %{address_line1: nil, address_line2: nil, cashier_counter: nil, display_name: nil, group: nil, is_retail: nil, license_number: nil, postcode: nil, size: nil, social_media_other: nil, social_media_website: nil, social_media_whatsapp: nil, state: nil, store_name: nil}

    def pharmacy_fixture(attrs \\ %{}) do
      {:ok, pharmacy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_pharmacy()

      pharmacy
    end

    test "list_pharmacies/0 returns all pharmacies" do
      pharmacy = pharmacy_fixture()
      assert Accounts.list_pharmacies() == [pharmacy]
    end

    test "get_pharmacy!/1 returns the pharmacy with given id" do
      pharmacy = pharmacy_fixture()
      assert Accounts.get_pharmacy!(pharmacy.id) == pharmacy
    end

    test "create_pharmacy/1 with valid data creates a pharmacy" do
      assert {:ok, %Pharmacy{} = pharmacy} = Accounts.create_pharmacy(@valid_attrs)
      assert pharmacy.address_line1 == "some address_line1"
      assert pharmacy.address_line2 == "some address_line2"
      assert pharmacy.cashier_counter == 42
      assert pharmacy.display_name == "some display_name"
      assert pharmacy.group == "some group"
      assert pharmacy.is_retail == true
      assert pharmacy.license_number == "some license_number"
      assert pharmacy.postcode == "some postcode"
      assert pharmacy.size == "some size"
      assert pharmacy.social_media_other == "some social_media_other"
      assert pharmacy.social_media_website == "some social_media_website"
      assert pharmacy.social_media_whatsapp == "some social_media_whatsapp"
      assert pharmacy.state == "some state"
      assert pharmacy.store_name == "some store_name"
    end

    test "create_pharmacy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_pharmacy(@invalid_attrs)
    end

    test "update_pharmacy/2 with valid data updates the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{} = pharmacy} = Accounts.update_pharmacy(pharmacy, @update_attrs)
      assert pharmacy.address_line1 == "some updated address_line1"
      assert pharmacy.address_line2 == "some updated address_line2"
      assert pharmacy.cashier_counter == 43
      assert pharmacy.display_name == "some updated display_name"
      assert pharmacy.group == "some updated group"
      assert pharmacy.is_retail == false
      assert pharmacy.license_number == "some updated license_number"
      assert pharmacy.postcode == "some updated postcode"
      assert pharmacy.size == "some updated size"
      assert pharmacy.social_media_other == "some updated social_media_other"
      assert pharmacy.social_media_website == "some updated social_media_website"
      assert pharmacy.social_media_whatsapp == "some updated social_media_whatsapp"
      assert pharmacy.state == "some updated state"
      assert pharmacy.store_name == "some updated store_name"
    end

    test "update_pharmacy/2 with invalid data returns error changeset" do
      pharmacy = pharmacy_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_pharmacy(pharmacy, @invalid_attrs)
      assert pharmacy == Accounts.get_pharmacy!(pharmacy.id)
    end

    test "delete_pharmacy/1 deletes the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{}} = Accounts.delete_pharmacy(pharmacy)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_pharmacy!(pharmacy.id) end
    end

    test "change_pharmacy/1 returns a pharmacy changeset" do
      pharmacy = pharmacy_fixture()
      assert %Ecto.Changeset{} = Accounts.change_pharmacy(pharmacy)
    end
  end

  describe "inventories" do
    alias Myppe.Accounts.Inventory

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def inventory_fixture(attrs \\ %{}) do
      {:ok, inventory} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_inventory()

      inventory
    end

    test "list_inventories/0 returns all inventories" do
      inventory = inventory_fixture()
      assert Accounts.list_inventories() == [inventory]
    end

    test "get_inventory!/1 returns the inventory with given id" do
      inventory = inventory_fixture()
      assert Accounts.get_inventory!(inventory.id) == inventory
    end

    test "create_inventory/1 with valid data creates a inventory" do
      assert {:ok, %Inventory{} = inventory} = Accounts.create_inventory(@valid_attrs)
    end

    test "create_inventory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_inventory(@invalid_attrs)
    end

    test "update_inventory/2 with valid data updates the inventory" do
      inventory = inventory_fixture()
      assert {:ok, %Inventory{} = inventory} = Accounts.update_inventory(inventory, @update_attrs)
    end

    test "update_inventory/2 with invalid data returns error changeset" do
      inventory = inventory_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_inventory(inventory, @invalid_attrs)
      assert inventory == Accounts.get_inventory!(inventory.id)
    end

    test "delete_inventory/1 deletes the inventory" do
      inventory = inventory_fixture()
      assert {:ok, %Inventory{}} = Accounts.delete_inventory(inventory)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_inventory!(inventory.id) end
    end

    test "change_inventory/1 returns a inventory changeset" do
      inventory = inventory_fixture()
      assert %Ecto.Changeset{} = Accounts.change_inventory(inventory)
    end
  end
end
