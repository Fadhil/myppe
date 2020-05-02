defmodule MyppeWeb.PharmacyControllerTest do
  use MyppeWeb.ConnCase

  alias Myppe.Bookings
  alias Myppe.Bookings.Pharmacy

  @create_attrs %{
    address_line1: "some address_line1",
    address_line2: "some address_line2",
    cashier_counter: 42,
    display_name: "some display_name",
    group: "some group",
    is_retail: true,
    license_number: "some license_number",
    name: "some name",
    pharmacy_type: "some pharmacy_type",
    postcode: "some postcode",
    size: "some size",
    social_media_other: "some social_media_other",
    social_media_website: "some social_media_website",
    social_media_whatsapp: "some social_media_whatsapp",
    state: "some state"
  }
  @update_attrs %{
    address_line1: "some updated address_line1",
    address_line2: "some updated address_line2",
    cashier_counter: 43,
    display_name: "some updated display_name",
    group: "some updated group",
    is_retail: false,
    license_number: "some updated license_number",
    name: "some updated name",
    pharmacy_type: "some updated pharmacy_type",
    postcode: "some updated postcode",
    size: "some updated size",
    social_media_other: "some updated social_media_other",
    social_media_website: "some updated social_media_website",
    social_media_whatsapp: "some updated social_media_whatsapp",
    state: "some updated state"
  }
  @invalid_attrs %{address_line1: nil, address_line2: nil, cashier_counter: nil, display_name: nil, group: nil, is_retail: nil, license_number: nil, name: nil, pharmacy_type: nil, postcode: nil, size: nil, social_media_other: nil, social_media_website: nil, social_media_whatsapp: nil, state: nil}

  def fixture(:pharmacy) do
    {:ok, pharmacy} = Bookings.create_pharmacy(@create_attrs)
    pharmacy
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pharmacies", %{conn: conn} do
      conn = get(conn, Routes.pharmacy_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pharmacy" do
    test "renders pharmacy when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pharmacy_path(conn, :create), pharmacy: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.pharmacy_path(conn, :show, id))

      assert %{
               "id" => id,
               "address_line1" => "some address_line1",
               "address_line2" => "some address_line2",
               "cashier_counter" => 42,
               "display_name" => "some display_name",
               "group" => "some group",
               "is_retail" => true,
               "license_number" => "some license_number",
               "name" => "some name",
               "pharmacy_type" => "some pharmacy_type",
               "postcode" => "some postcode",
               "size" => "some size",
               "social_media_other" => "some social_media_other",
               "social_media_website" => "some social_media_website",
               "social_media_whatsapp" => "some social_media_whatsapp",
               "state" => "some state"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pharmacy_path(conn, :create), pharmacy: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pharmacy" do
    setup [:create_pharmacy]

    test "renders pharmacy when data is valid", %{conn: conn, pharmacy: %Pharmacy{id: id} = pharmacy} do
      conn = put(conn, Routes.pharmacy_path(conn, :update, pharmacy), pharmacy: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.pharmacy_path(conn, :show, id))

      assert %{
               "id" => id,
               "address_line1" => "some updated address_line1",
               "address_line2" => "some updated address_line2",
               "cashier_counter" => 43,
               "display_name" => "some updated display_name",
               "group" => "some updated group",
               "is_retail" => false,
               "license_number" => "some updated license_number",
               "name" => "some updated name",
               "pharmacy_type" => "some updated pharmacy_type",
               "postcode" => "some updated postcode",
               "size" => "some updated size",
               "social_media_other" => "some updated social_media_other",
               "social_media_website" => "some updated social_media_website",
               "social_media_whatsapp" => "some updated social_media_whatsapp",
               "state" => "some updated state"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pharmacy: pharmacy} do
      conn = put(conn, Routes.pharmacy_path(conn, :update, pharmacy), pharmacy: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pharmacy" do
    setup [:create_pharmacy]

    test "deletes chosen pharmacy", %{conn: conn, pharmacy: pharmacy} do
      conn = delete(conn, Routes.pharmacy_path(conn, :delete, pharmacy))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.pharmacy_path(conn, :show, pharmacy))
      end
    end
  end

  defp create_pharmacy(_) do
    pharmacy = fixture(:pharmacy)
    {:ok, pharmacy: pharmacy}
  end
end
