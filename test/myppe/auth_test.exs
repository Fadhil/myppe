defmodule Myppe.AuthTest do
  use Myppe.DataCase

  alias Myppe.Auth

  describe "users" do
    alias Myppe.Auth.User

    @valid_attrs %{email: "some email", id_number: "some id_number", password_hash: "some password_hash", phone: "some phone"}
    @update_attrs %{email: "some updated email", id_number: "some updated id_number", password_hash: "some updated password_hash", phone: "some updated phone"}
    @invalid_attrs %{email: nil, id_number: nil, password_hash: nil, phone: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Auth.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Auth.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Auth.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.id_number == "some id_number"
      assert user.password_hash == "some password_hash"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Auth.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.id_number == "some updated id_number"
      assert user.password_hash == "some updated password_hash"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_user(user, @invalid_attrs)
      assert user == Auth.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Auth.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Auth.change_user(user)
    end
  end

  describe "admins" do
    alias Myppe.Auth.Admin

    @valid_attrs %{email: "some email", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password_hash: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Auth.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Auth.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Auth.create_admin(@valid_attrs)
      assert admin.email == "some email"
      assert admin.password_hash == "some password_hash"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = Auth.update_admin(admin, @update_attrs)
      assert admin.email == "some updated email"
      assert admin.password_hash == "some updated password_hash"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_admin(admin, @invalid_attrs)
      assert admin == Auth.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Auth.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Auth.change_admin(admin)
    end
  end
end
