defmodule Myppe.BookingTest do
  use Myppe.DataCase

  alias Myppe.Booking

  describe "pharmacies" do
    alias Myppe.Booking.Pharmacy

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def pharmacy_fixture(attrs \\ %{}) do
      {:ok, pharmacy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_pharmacy()

      pharmacy
    end

    test "list_pharmacies/0 returns all pharmacies" do
      pharmacy = pharmacy_fixture()
      assert Booking.list_pharmacies() == [pharmacy]
    end

    test "get_pharmacy!/1 returns the pharmacy with given id" do
      pharmacy = pharmacy_fixture()
      assert Booking.get_pharmacy!(pharmacy.id) == pharmacy
    end

    test "create_pharmacy/1 with valid data creates a pharmacy" do
      assert {:ok, %Pharmacy{} = pharmacy} = Booking.create_pharmacy(@valid_attrs)
      assert pharmacy.name == "some name"
    end

    test "create_pharmacy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_pharmacy(@invalid_attrs)
    end

    test "update_pharmacy/2 with valid data updates the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{} = pharmacy} = Booking.update_pharmacy(pharmacy, @update_attrs)
      assert pharmacy.name == "some updated name"
    end

    test "update_pharmacy/2 with invalid data returns error changeset" do
      pharmacy = pharmacy_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_pharmacy(pharmacy, @invalid_attrs)
      assert pharmacy == Booking.get_pharmacy!(pharmacy.id)
    end

    test "delete_pharmacy/1 deletes the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{}} = Booking.delete_pharmacy(pharmacy)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_pharmacy!(pharmacy.id) end
    end

    test "change_pharmacy/1 returns a pharmacy changeset" do
      pharmacy = pharmacy_fixture()
      assert %Ecto.Changeset{} = Booking.change_pharmacy(pharmacy)
    end
  end

  describe "slots" do
    alias Myppe.Booking.Slot

    @valid_attrs %{date: ~N[2010-04-17 14:00:00], slot_id: 42}
    @update_attrs %{date: ~N[2011-05-18 15:01:01], slot_id: 43}
    @invalid_attrs %{date: nil, slot_id: nil}

    def slot_fixture(attrs \\ %{}) do
      {:ok, slot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_slot()

      slot
    end

    test "list_slots/0 returns all slots" do
      slot = slot_fixture()
      assert Booking.list_slots() == [slot]
    end

    test "get_slot!/1 returns the slot with given id" do
      slot = slot_fixture()
      assert Booking.get_slot!(slot.id) == slot
    end

    test "create_slot/1 with valid data creates a slot" do
      assert {:ok, %Slot{} = slot} = Booking.create_slot(@valid_attrs)
      assert slot.date == ~N[2010-04-17 14:00:00]
      assert slot.slot_id == 42
    end

    test "create_slot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_slot(@invalid_attrs)
    end

    test "update_slot/2 with valid data updates the slot" do
      slot = slot_fixture()
      assert {:ok, %Slot{} = slot} = Booking.update_slot(slot, @update_attrs)
      assert slot.date == ~N[2011-05-18 15:01:01]
      assert slot.slot_id == 43
    end

    test "update_slot/2 with invalid data returns error changeset" do
      slot = slot_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_slot(slot, @invalid_attrs)
      assert slot == Booking.get_slot!(slot.id)
    end

    test "delete_slot/1 deletes the slot" do
      slot = slot_fixture()
      assert {:ok, %Slot{}} = Booking.delete_slot(slot)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_slot!(slot.id) end
    end

    test "change_slot/1 returns a slot changeset" do
      slot = slot_fixture()
      assert %Ecto.Changeset{} = Booking.change_slot(slot)
    end
  end

  describe "timeslots" do
    alias Myppe.Booking.Timeslot

    @valid_attrs %{quarter: 42}
    @update_attrs %{quarter: 43}
    @invalid_attrs %{quarter: nil}

    def timeslot_fixture(attrs \\ %{}) do
      {:ok, timeslot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_timeslot()

      timeslot
    end

    test "list_timeslots/0 returns all timeslots" do
      timeslot = timeslot_fixture()
      assert Booking.list_timeslots() == [timeslot]
    end

    test "get_timeslot!/1 returns the timeslot with given id" do
      timeslot = timeslot_fixture()
      assert Booking.get_timeslot!(timeslot.id) == timeslot
    end

    test "create_timeslot/1 with valid data creates a timeslot" do
      assert {:ok, %Timeslot{} = timeslot} = Booking.create_timeslot(@valid_attrs)
      assert timeslot.quarter == 42
    end

    test "create_timeslot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_timeslot(@invalid_attrs)
    end

    test "update_timeslot/2 with valid data updates the timeslot" do
      timeslot = timeslot_fixture()
      assert {:ok, %Timeslot{} = timeslot} = Booking.update_timeslot(timeslot, @update_attrs)
      assert timeslot.quarter == 43
    end

    test "update_timeslot/2 with invalid data returns error changeset" do
      timeslot = timeslot_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_timeslot(timeslot, @invalid_attrs)
      assert timeslot == Booking.get_timeslot!(timeslot.id)
    end

    test "delete_timeslot/1 deletes the timeslot" do
      timeslot = timeslot_fixture()
      assert {:ok, %Timeslot{}} = Booking.delete_timeslot(timeslot)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_timeslot!(timeslot.id) end
    end

    test "change_timeslot/1 returns a timeslot changeset" do
      timeslot = timeslot_fixture()
      assert %Ecto.Changeset{} = Booking.change_timeslot(timeslot)
    end
  end

  describe "users" do
    alias Myppe.Booking.User

    @valid_attrs %{email: "some email", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Booking.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Booking.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Booking.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Booking.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_user(user, @invalid_attrs)
      assert user == Booking.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Booking.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Booking.change_user(user)
    end
  end

  describe "bookings" do
    alias Myppe.Booking.UserBooking

    @valid_attrs %{status: "some status"}
    @update_attrs %{status: "some updated status"}
    @invalid_attrs %{status: nil}

    def user_booking_fixture(attrs \\ %{}) do
      {:ok, user_booking} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_user_booking()

      user_booking
    end

    test "list_bookings/0 returns all bookings" do
      user_booking = user_booking_fixture()
      assert Booking.list_bookings() == [user_booking]
    end

    test "get_user_booking!/1 returns the user_booking with given id" do
      user_booking = user_booking_fixture()
      assert Booking.get_user_booking!(user_booking.id) == user_booking
    end

    test "create_user_booking/1 with valid data creates a user_booking" do
      assert {:ok, %UserBooking{} = user_booking} = Booking.create_user_booking(@valid_attrs)
      assert user_booking.status == "some status"
    end

    test "create_user_booking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_user_booking(@invalid_attrs)
    end

    test "update_user_booking/2 with valid data updates the user_booking" do
      user_booking = user_booking_fixture()
      assert {:ok, %UserBooking{} = user_booking} = Booking.update_user_booking(user_booking, @update_attrs)
      assert user_booking.status == "some updated status"
    end

    test "update_user_booking/2 with invalid data returns error changeset" do
      user_booking = user_booking_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_user_booking(user_booking, @invalid_attrs)
      assert user_booking == Booking.get_user_booking!(user_booking.id)
    end

    test "delete_user_booking/1 deletes the user_booking" do
      user_booking = user_booking_fixture()
      assert {:ok, %UserBooking{}} = Booking.delete_user_booking(user_booking)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_user_booking!(user_booking.id) end
    end

    test "change_user_booking/1 returns a user_booking changeset" do
      user_booking = user_booking_fixture()
      assert %Ecto.Changeset{} = Booking.change_user_booking(user_booking)
    end
  end

  describe "line_items" do
    alias Myppe.Booking.LineItem

    @valid_attrs %{price_cents: 42, quantity: 42}
    @update_attrs %{price_cents: 43, quantity: 43}
    @invalid_attrs %{price_cents: nil, quantity: nil}

    def line_item_fixture(attrs \\ %{}) do
      {:ok, line_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_line_item()

      line_item
    end

    test "list_line_items/0 returns all line_items" do
      line_item = line_item_fixture()
      assert Booking.list_line_items() == [line_item]
    end

    test "get_line_item!/1 returns the line_item with given id" do
      line_item = line_item_fixture()
      assert Booking.get_line_item!(line_item.id) == line_item
    end

    test "create_line_item/1 with valid data creates a line_item" do
      assert {:ok, %LineItem{} = line_item} = Booking.create_line_item(@valid_attrs)
      assert line_item.price_cents == 42
      assert line_item.quantity == 42
    end

    test "create_line_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_line_item(@invalid_attrs)
    end

    test "update_line_item/2 with valid data updates the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{} = line_item} = Booking.update_line_item(line_item, @update_attrs)
      assert line_item.price_cents == 43
      assert line_item.quantity == 43
    end

    test "update_line_item/2 with invalid data returns error changeset" do
      line_item = line_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_line_item(line_item, @invalid_attrs)
      assert line_item == Booking.get_line_item!(line_item.id)
    end

    test "delete_line_item/1 deletes the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{}} = Booking.delete_line_item(line_item)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_line_item!(line_item.id) end
    end

    test "change_line_item/1 returns a line_item changeset" do
      line_item = line_item_fixture()
      assert %Ecto.Changeset{} = Booking.change_line_item(line_item)
    end
  end

  describe "products" do
    alias Myppe.Booking.Product

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Booking.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Booking.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Booking.create_product(@valid_attrs)
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Booking.update_product(product, @update_attrs)
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_product(product, @invalid_attrs)
      assert product == Booking.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Booking.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Booking.change_product(product)
    end
  end

  describe "opening_hours" do
    alias Myppe.Booking.OpeningHours

    @valid_attrs %{day: 42, end_time: "some end_time", start_time: "some start_time"}
    @update_attrs %{day: 43, end_time: "some updated end_time", start_time: "some updated start_time"}
    @invalid_attrs %{day: nil, end_time: nil, start_time: nil}

    def opening_hours_fixture(attrs \\ %{}) do
      {:ok, opening_hours} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_opening_hours()

      opening_hours
    end

    test "list_opening_hours/0 returns all opening_hours" do
      opening_hours = opening_hours_fixture()
      assert Booking.list_opening_hours() == [opening_hours]
    end

    test "get_opening_hours!/1 returns the opening_hours with given id" do
      opening_hours = opening_hours_fixture()
      assert Booking.get_opening_hours!(opening_hours.id) == opening_hours
    end

    test "create_opening_hours/1 with valid data creates a opening_hours" do
      assert {:ok, %OpeningHours{} = opening_hours} = Booking.create_opening_hours(@valid_attrs)
      assert opening_hours.day == 42
      assert opening_hours.end_time == "some end_time"
      assert opening_hours.start_time == "some start_time"
    end

    test "create_opening_hours/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_opening_hours(@invalid_attrs)
    end

    test "update_opening_hours/2 with valid data updates the opening_hours" do
      opening_hours = opening_hours_fixture()
      assert {:ok, %OpeningHours{} = opening_hours} = Booking.update_opening_hours(opening_hours, @update_attrs)
      assert opening_hours.day == 43
      assert opening_hours.end_time == "some updated end_time"
      assert opening_hours.start_time == "some updated start_time"
    end

    test "update_opening_hours/2 with invalid data returns error changeset" do
      opening_hours = opening_hours_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_opening_hours(opening_hours, @invalid_attrs)
      assert opening_hours == Booking.get_opening_hours!(opening_hours.id)
    end

    test "delete_opening_hours/1 deletes the opening_hours" do
      opening_hours = opening_hours_fixture()
      assert {:ok, %OpeningHours{}} = Booking.delete_opening_hours(opening_hours)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_opening_hours!(opening_hours.id) end
    end

    test "change_opening_hours/1 returns a opening_hours changeset" do
      opening_hours = opening_hours_fixture()
      assert %Ecto.Changeset{} = Booking.change_opening_hours(opening_hours)
    end
  end

  describe "admins" do
    alias Myppe.Booking.Admin

    @valid_attrs %{email: "some email", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password_hash: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Booking.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Booking.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Booking.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Booking.create_admin(@valid_attrs)
      assert admin.email == "some email"
      assert admin.password_hash == "some password_hash"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Booking.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = Booking.update_admin(admin, @update_attrs)
      assert admin.email == "some updated email"
      assert admin.password_hash == "some updated password_hash"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Booking.update_admin(admin, @invalid_attrs)
      assert admin == Booking.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Booking.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Booking.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Booking.change_admin(admin)
    end
  end
end
