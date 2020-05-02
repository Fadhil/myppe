defmodule Myppe.BookingsTest do
  use Myppe.DataCase

  alias Myppe.Bookings

  describe "pharmacies" do
    alias Myppe.Bookings.Pharmacy

    @valid_attrs %{address_line1: "some address_line1", address_line2: "some address_line2", cashier_counter: 42, display_name: "some display_name", group: "some group", is_retail: true, license_number: "some license_number", name: "some name", pharmacy_type: "some pharmacy_type", postcode: "some postcode", size: "some size", social_media_other: "some social_media_other", social_media_website: "some social_media_website", social_media_whatsapp: "some social_media_whatsapp", state: "some state"}
    @update_attrs %{address_line1: "some updated address_line1", address_line2: "some updated address_line2", cashier_counter: 43, display_name: "some updated display_name", group: "some updated group", is_retail: false, license_number: "some updated license_number", name: "some updated name", pharmacy_type: "some updated pharmacy_type", postcode: "some updated postcode", size: "some updated size", social_media_other: "some updated social_media_other", social_media_website: "some updated social_media_website", social_media_whatsapp: "some updated social_media_whatsapp", state: "some updated state"}
    @invalid_attrs %{address_line1: nil, address_line2: nil, cashier_counter: nil, display_name: nil, group: nil, is_retail: nil, license_number: nil, name: nil, pharmacy_type: nil, postcode: nil, size: nil, social_media_other: nil, social_media_website: nil, social_media_whatsapp: nil, state: nil}

    def pharmacy_fixture(attrs \\ %{}) do
      {:ok, pharmacy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookings.create_pharmacy()

      pharmacy
    end

    test "list_pharmacies/0 returns all pharmacies" do
      pharmacy = pharmacy_fixture()
      assert Bookings.list_pharmacies() == [pharmacy]
    end

    test "get_pharmacy!/1 returns the pharmacy with given id" do
      pharmacy = pharmacy_fixture()
      assert Bookings.get_pharmacy!(pharmacy.id) == pharmacy
    end

    test "create_pharmacy/1 with valid data creates a pharmacy" do
      assert {:ok, %Pharmacy{} = pharmacy} = Bookings.create_pharmacy(@valid_attrs)
      assert pharmacy.address_line1 == "some address_line1"
      assert pharmacy.address_line2 == "some address_line2"
      assert pharmacy.cashier_counter == 42
      assert pharmacy.display_name == "some display_name"
      assert pharmacy.group == "some group"
      assert pharmacy.is_retail == true
      assert pharmacy.license_number == "some license_number"
      assert pharmacy.name == "some name"
      assert pharmacy.pharmacy_type == "some pharmacy_type"
      assert pharmacy.postcode == "some postcode"
      assert pharmacy.size == "some size"
      assert pharmacy.social_media_other == "some social_media_other"
      assert pharmacy.social_media_website == "some social_media_website"
      assert pharmacy.social_media_whatsapp == "some social_media_whatsapp"
      assert pharmacy.state == "some state"
    end

    test "create_pharmacy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_pharmacy(@invalid_attrs)
    end

    test "update_pharmacy/2 with valid data updates the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{} = pharmacy} = Bookings.update_pharmacy(pharmacy, @update_attrs)
      assert pharmacy.address_line1 == "some updated address_line1"
      assert pharmacy.address_line2 == "some updated address_line2"
      assert pharmacy.cashier_counter == 43
      assert pharmacy.display_name == "some updated display_name"
      assert pharmacy.group == "some updated group"
      assert pharmacy.is_retail == false
      assert pharmacy.license_number == "some updated license_number"
      assert pharmacy.name == "some updated name"
      assert pharmacy.pharmacy_type == "some updated pharmacy_type"
      assert pharmacy.postcode == "some updated postcode"
      assert pharmacy.size == "some updated size"
      assert pharmacy.social_media_other == "some updated social_media_other"
      assert pharmacy.social_media_website == "some updated social_media_website"
      assert pharmacy.social_media_whatsapp == "some updated social_media_whatsapp"
      assert pharmacy.state == "some updated state"
    end

    test "update_pharmacy/2 with invalid data returns error changeset" do
      pharmacy = pharmacy_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_pharmacy(pharmacy, @invalid_attrs)
      assert pharmacy == Bookings.get_pharmacy!(pharmacy.id)
    end

    test "delete_pharmacy/1 deletes the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{}} = Bookings.delete_pharmacy(pharmacy)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_pharmacy!(pharmacy.id) end
    end

    test "change_pharmacy/1 returns a pharmacy changeset" do
      pharmacy = pharmacy_fixture()
      assert %Ecto.Changeset{} = Bookings.change_pharmacy(pharmacy)
    end
  end
end
