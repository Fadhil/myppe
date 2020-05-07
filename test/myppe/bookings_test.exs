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

  describe "reports" do
    alias Myppe.Bookings.Report

    @valid_attrs %{report_type: 42}
    @update_attrs %{report_type: 43}
    @invalid_attrs %{report_type: nil}

    def report_fixture(attrs \\ %{}) do
      {:ok, report} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookings.create_report()

      report
    end

    test "list_reports/0 returns all reports" do
      report = report_fixture()
      assert Bookings.list_reports() == [report]
    end

    test "get_report!/1 returns the report with given id" do
      report = report_fixture()
      assert Bookings.get_report!(report.id) == report
    end

    test "create_report/1 with valid data creates a report" do
      assert {:ok, %Report{} = report} = Bookings.create_report(@valid_attrs)
      assert report.report_type == 42
    end

    test "create_report/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_report(@invalid_attrs)
    end

    test "update_report/2 with valid data updates the report" do
      report = report_fixture()
      assert {:ok, %Report{} = report} = Bookings.update_report(report, @update_attrs)
      assert report.report_type == 43
    end

    test "update_report/2 with invalid data returns error changeset" do
      report = report_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_report(report, @invalid_attrs)
      assert report == Bookings.get_report!(report.id)
    end

    test "delete_report/1 deletes the report" do
      report = report_fixture()
      assert {:ok, %Report{}} = Bookings.delete_report(report)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_report!(report.id) end
    end

    test "change_report/1 returns a report changeset" do
      report = report_fixture()
      assert %Ecto.Changeset{} = Bookings.change_report(report)
    end
  end

  describe "reported_items" do
    alias Myppe.Bookings.ReportedItem

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def reported_item_fixture(attrs \\ %{}) do
      {:ok, reported_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookings.create_reported_item()

      reported_item
    end

    test "list_reported_items/0 returns all reported_items" do
      reported_item = reported_item_fixture()
      assert Bookings.list_reported_items() == [reported_item]
    end

    test "get_reported_item!/1 returns the reported_item with given id" do
      reported_item = reported_item_fixture()
      assert Bookings.get_reported_item!(reported_item.id) == reported_item
    end

    test "create_reported_item/1 with valid data creates a reported_item" do
      assert {:ok, %ReportedItem{} = reported_item} = Bookings.create_reported_item(@valid_attrs)
    end

    test "create_reported_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_reported_item(@invalid_attrs)
    end

    test "update_reported_item/2 with valid data updates the reported_item" do
      reported_item = reported_item_fixture()
      assert {:ok, %ReportedItem{} = reported_item} = Bookings.update_reported_item(reported_item, @update_attrs)
    end

    test "update_reported_item/2 with invalid data returns error changeset" do
      reported_item = reported_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_reported_item(reported_item, @invalid_attrs)
      assert reported_item == Bookings.get_reported_item!(reported_item.id)
    end

    test "delete_reported_item/1 deletes the reported_item" do
      reported_item = reported_item_fixture()
      assert {:ok, %ReportedItem{}} = Bookings.delete_reported_item(reported_item)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_reported_item!(reported_item.id) end
    end

    test "change_reported_item/1 returns a reported_item changeset" do
      reported_item = reported_item_fixture()
      assert %Ecto.Changeset{} = Bookings.change_reported_item(reported_item)
    end
  end
end
