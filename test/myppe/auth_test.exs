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

  describe "user_sessions" do
    alias Myppe.Auth.UserSession

    @valid_attrs %{token: "some token"}
    @update_attrs %{token: "some updated token"}
    @invalid_attrs %{token: nil}

    def user_session_fixture(attrs \\ %{}) do
      {:ok, user_session} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_user_session()

      user_session
    end

    test "list_user_sessions/0 returns all user_sessions" do
      user_session = user_session_fixture()
      assert Auth.list_user_sessions() == [user_session]
    end

    test "get_user_session!/1 returns the user_session with given id" do
      user_session = user_session_fixture()
      assert Auth.get_user_session!(user_session.id) == user_session
    end

    test "create_user_session/1 with valid data creates a user_session" do
      assert {:ok, %UserSession{} = user_session} = Auth.create_user_session(@valid_attrs)
      assert user_session.token == "some token"
    end

    test "create_user_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user_session(@invalid_attrs)
    end

    test "update_user_session/2 with valid data updates the user_session" do
      user_session = user_session_fixture()
      assert {:ok, %UserSession{} = user_session} = Auth.update_user_session(user_session, @update_attrs)
      assert user_session.token == "some updated token"
    end

    test "update_user_session/2 with invalid data returns error changeset" do
      user_session = user_session_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_user_session(user_session, @invalid_attrs)
      assert user_session == Auth.get_user_session!(user_session.id)
    end

    test "delete_user_session/1 deletes the user_session" do
      user_session = user_session_fixture()
      assert {:ok, %UserSession{}} = Auth.delete_user_session(user_session)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user_session!(user_session.id) end
    end

    test "change_user_session/1 returns a user_session changeset" do
      user_session = user_session_fixture()
      assert %Ecto.Changeset{} = Auth.change_user_session(user_session)
    end
  end

  describe "admin_sessions" do
    alias Myppe.Auth.AdminSession

    @valid_attrs %{token: "some token"}
    @update_attrs %{token: "some updated token"}
    @invalid_attrs %{token: nil}

    def admin_session_fixture(attrs \\ %{}) do
      {:ok, admin_session} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_admin_session()

      admin_session
    end

    test "list_admin_sessions/0 returns all admin_sessions" do
      admin_session = admin_session_fixture()
      assert Auth.list_admin_sessions() == [admin_session]
    end

    test "get_admin_session!/1 returns the admin_session with given id" do
      admin_session = admin_session_fixture()
      assert Auth.get_admin_session!(admin_session.id) == admin_session
    end

    test "create_admin_session/1 with valid data creates a admin_session" do
      assert {:ok, %AdminSession{} = admin_session} = Auth.create_admin_session(@valid_attrs)
      assert admin_session.token == "some token"
    end

    test "create_admin_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_admin_session(@invalid_attrs)
    end

    test "update_admin_session/2 with valid data updates the admin_session" do
      admin_session = admin_session_fixture()
      assert {:ok, %AdminSession{} = admin_session} = Auth.update_admin_session(admin_session, @update_attrs)
      assert admin_session.token == "some updated token"
    end

    test "update_admin_session/2 with invalid data returns error changeset" do
      admin_session = admin_session_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_admin_session(admin_session, @invalid_attrs)
      assert admin_session == Auth.get_admin_session!(admin_session.id)
    end

    test "delete_admin_session/1 deletes the admin_session" do
      admin_session = admin_session_fixture()
      assert {:ok, %AdminSession{}} = Auth.delete_admin_session(admin_session)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_admin_session!(admin_session.id) end
    end

    test "change_admin_session/1 returns a admin_session changeset" do
      admin_session = admin_session_fixture()
      assert %Ecto.Changeset{} = Auth.change_admin_session(admin_session)
    end
  end
end
