defmodule MyppeWeb.AdminSessionControllerTest do
  use MyppeWeb.ConnCase

  alias Myppe.Auth
  alias Myppe.Auth.AdminSession

  @create_attrs %{
    token: "some token"
  }
  @update_attrs %{
    token: "some updated token"
  }
  @invalid_attrs %{token: nil}

  def fixture(:admin_session) do
    {:ok, admin_session} = Auth.create_admin_session(@create_attrs)
    admin_session
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all admin_sessions", %{conn: conn} do
      conn = get(conn, Routes.admin_session_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create admin_session" do
    test "renders admin_session when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_session_path(conn, :create), admin_session: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.admin_session_path(conn, :show, id))

      assert %{
               "id" => id,
               "token" => "some token"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_session_path(conn, :create), admin_session: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update admin_session" do
    setup [:create_admin_session]

    test "renders admin_session when data is valid", %{conn: conn, admin_session: %AdminSession{id: id} = admin_session} do
      conn = put(conn, Routes.admin_session_path(conn, :update, admin_session), admin_session: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.admin_session_path(conn, :show, id))

      assert %{
               "id" => id,
               "token" => "some updated token"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, admin_session: admin_session} do
      conn = put(conn, Routes.admin_session_path(conn, :update, admin_session), admin_session: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete admin_session" do
    setup [:create_admin_session]

    test "deletes chosen admin_session", %{conn: conn, admin_session: admin_session} do
      conn = delete(conn, Routes.admin_session_path(conn, :delete, admin_session))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.admin_session_path(conn, :show, admin_session))
      end
    end
  end

  defp create_admin_session(_) do
    admin_session = fixture(:admin_session)
    {:ok, admin_session: admin_session}
  end
end
