defmodule Myppe.Bookings do
  @moduledoc """
  The Booking context.
  """


  import Ecto.Query, warn: false
  alias Myppe.Repo

  alias Myppe.Bookings.Pharmacy

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

  alias Myppe.Bookings.Slot

  @doc """
  Returns the list of slots.

  ## Examples

      iex> list_slots()
      [%Slot{}, ...]

  """
  def list_slots do
    Repo.all(Slot)
  end

  @doc """
  Gets a single slot.

  Raises `Ecto.NoResultsError` if the Slot does not exist.

  ## Examples

      iex> get_slot!(123)
      %Slot{}

      iex> get_slot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_slot!(id), do: Repo.get!(Slot, id)

  @doc """
  Gets a slot by pharmacy and slot_id
  """
  def get_slot(pharmacy, slot_id) do
    get_slot_query(pharmacy, slot_id)
    |> Myppe.Repo.one()
  end

  def get_slot_query(pharmacy, slot_id) do
    from s in Myppe.Bookings.Slot,
      join: p in assoc(s, :pharmacy),
      where: p.id == ^pharmacy.id,
      where: s.slot_id == ^slot_id
  end

  @doc """
  Creates a slot.

  ## Examples

      iex> create_slot(%{field: value})
      {:ok, %Slot{}}

      iex> create_slot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_slot(attrs \\ %{}) do
    %Slot{}
    |> Slot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a slot.

  ## Examples

      iex> update_slot(slot, %{field: new_value})
      {:ok, %Slot{}}

      iex> update_slot(slot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_slot(%Slot{} = slot, attrs) do
    slot
    |> Slot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a slot.

  ## Examples

      iex> delete_slot(slot)
      {:ok, %Slot{}}

      iex> delete_slot(slot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_slot(%Slot{} = slot) do
    Repo.delete(slot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking slot changes.

  ## Examples

      iex> change_slot(slot)
      %Ecto.Changeset{source: %Slot{}}

  """
  def change_slot(%Slot{} = slot) do
    Slot.changeset(slot, %{})
  end

  alias Myppe.Bookings.Timeslot

  @doc """
  Returns the list of timeslots.

  ## Examples

      iex> list_timeslots()
      [%Timeslot{}, ...]

  """
  def list_timeslots do
    Repo.all(Timeslot)
  end

  @doc """
  Returns a list of timeslots and bookings for a given pharmacy and slot_id
  """
  def list_timeslots_with_bookings(pharmacy, slot_id) do
    list_timeslots_with_bookings_query(pharmacy, slot_id)
    |> Myppe.Repo.all()
    |> Myppe.Repo.preload(:bookings)
  end

  def list_timeslots_with_bookings_query(pharmacy, slot_id) do
    from t in Myppe.Bookings.Timeslot,
      join: s in assoc(t, :slot),
      join: p in assoc(s, :pharmacy),
      where: p.id == ^pharmacy.id,
      where: s.slot_id == ^slot_id
  end

  @doc """
  Gets a single timeslot.

  Raises `Ecto.NoResultsError` if the Timeslot does not exist.

  ## Examples

      iex> get_timeslot!(123)
      %Timeslot{}

      iex> get_timeslot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_timeslot!(id), do: Repo.get!(Timeslot, id)

  @doc """
  Get a timeslot by slot and quarter
  """
  def get_timeslot(slot, quarter) do
    get_timeslot_query(slot, quarter)
    |> Myppe.Repo.one()
  end

  def get_timeslot_query(slot, quarter) do
    from t in Myppe.Bookings.Timeslot,
      join: s in assoc(t, :slot),
      where: s.id == ^slot.id,
      where: t.quarter == ^quarter
  end

  @doc """
  Creates a timeslot.

  ## Examples

      iex> create_timeslot(%{field: value})
      {:ok, %Timeslot{}}

      iex> create_timeslot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_timeslot(attrs \\ %{}) do
    %Timeslot{}
    |> Timeslot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a timeslot.

  ## Examples

      iex> update_timeslot(timeslot, %{field: new_value})
      {:ok, %Timeslot{}}

      iex> update_timeslot(timeslot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_timeslot(%Timeslot{} = timeslot, attrs) do
    timeslot
    |> Timeslot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a timeslot.

  ## Examples

      iex> delete_timeslot(timeslot)
      {:ok, %Timeslot{}}

      iex> delete_timeslot(timeslot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_timeslot(%Timeslot{} = timeslot) do
    Repo.delete(timeslot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking timeslot changes.

  ## Examples

      iex> change_timeslot(timeslot)
      %Ecto.Changeset{source: %Timeslot{}}

  """
  def change_timeslot(%Timeslot{} = timeslot) do
    Timeslot.changeset(timeslot, %{})
  end

  alias Myppe.Bookings.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Myppe.Bookings.Booking

  @doc """
  Returns the list of bookings.

  ## Examples

      iex> list_bookings()
      [%Booking{}, ...]

  """
  def list_bookings do
    Repo.all(Booking)
  end

  @doc """
  Returns a list of bookings for a given pharmacy and  slot_id. This
  effectively returns bookings for an entire hour block based on slot_id
  """
  def list_bookings(pharmacy, slot_id) do
    list_bookings_query(pharmacy, slot_id)
    |> Myppe.Repo.all
  end

  def list_bookings_query(pharmacy, slot_id) do
    from b in Myppe.Bookings.Booking,
      join: t in assoc(b, :timeslot),
      join: s in assoc(t, :slot),
      join: p in assoc(s, :pharmacy),
      where: p.id == ^pharmacy.id,
      where: s.slot_id == ^slot_id
  end

  @doc """
  Gets a single user_booking.

  Raises `Ecto.NoResultsError` if the User booking does not exist.

  ## Examples

      iex> get_user_booking!(123)
      %Booking{}

      iex> get_user_booking!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_booking!(id), do: Repo.get!(Booking, id)

  @doc """
  Creates a user_booking.

  ## Examples

      iex> create_user_booking(%{field: value})
      {:ok, %Booking{}}

      iex> create_user_booking(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_booking(attrs \\ %{}) do
    %Booking{}
    |> Booking.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_booking.

  ## Examples

      iex> update_user_booking(user_booking, %{field: new_value})
      {:ok, %Booking{}}

      iex> update_user_booking(user_booking, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_booking(%Booking{} = user_booking, attrs) do
    user_booking
    |> Booking.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_booking.

  ## Examples

      iex> delete_user_booking(user_booking)
      {:ok, %Booking{}}

      iex> delete_user_booking(user_booking)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_booking(%Booking{} = user_booking) do
    Repo.delete(user_booking)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_booking changes.

  ## Examples

      iex> change_user_booking(user_booking)
      %Ecto.Changeset{source: %Booking{}}

  """
  def change_user_booking(%Booking{} = user_booking) do
    Booking.changeset(user_booking, %{})
  end

  alias Myppe.Bookings.LineItem

  @doc """
  Returns the list of line_items.

  ## Examples

      iex> list_line_items()
      [%LineItem{}, ...]

  """
  def list_line_items do
    Repo.all(LineItem)
  end

  @doc """
  Gets a single line_item.

  Raises `Ecto.NoResultsError` if the Line item does not exist.

  ## Examples

      iex> get_line_item!(123)
      %LineItem{}

      iex> get_line_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_line_item!(id), do: Repo.get!(LineItem, id)

  @doc """
  Creates a line_item.

  ## Examples

      iex> create_line_item(%{field: value})
      {:ok, %LineItem{}}

      iex> create_line_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_line_item(attrs \\ %{}) do
    %LineItem{}
    |> LineItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a line_item.

  ## Examples

      iex> update_line_item(line_item, %{field: new_value})
      {:ok, %LineItem{}}

      iex> update_line_item(line_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_line_item(%LineItem{} = line_item, attrs) do
    line_item
    |> LineItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a line_item.

  ## Examples

      iex> delete_line_item(line_item)
      {:ok, %LineItem{}}

      iex> delete_line_item(line_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_line_item(%LineItem{} = line_item) do
    Repo.delete(line_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking line_item changes.

  ## Examples

      iex> change_line_item(line_item)
      %Ecto.Changeset{source: %LineItem{}}

  """
  def change_line_item(%LineItem{} = line_item) do
    LineItem.changeset(line_item, %{})
  end

  alias Myppe.Bookings.Product

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

  alias Myppe.Bookings.OpeningHour

  @doc """
  Returns the list of opening_hours.

  ## Examples

      iex> list_opening_hours()
      [%OpeningHour{}, ...]

  """
  def list_opening_hours do
    Repo.all(OpeningHour)
  end

  @doc """
  Gets a single opening_hours.

  Raises `Ecto.NoResultsError` if the Opening hours does not exist.

  ## Examples

      iex> get_opening_hours!(123)
      %OpeningHour{}

      iex> get_opening_hours!(456)
      ** (Ecto.NoResultsError)

  """
  def get_opening_hours!(id), do: Repo.get!(OpeningHour, id)

  @doc """
  Creates a opening_hours.

  ## Examples

      iex> create_opening_hours(%{field: value})
      {:ok, %OpeningHour{}}

      iex> create_opening_hours(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_opening_hours(attrs \\ %{}) do
    %OpeningHour{}
    |> OpeningHour.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a opening_hours.

  ## Examples

      iex> update_opening_hours(opening_hours, %{field: new_value})
      {:ok, %OpeningHour{}}

      iex> update_opening_hours(opening_hours, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_opening_hours(%OpeningHour{} = opening_hours, attrs) do
    opening_hours
    |> OpeningHour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a opening_hours.

  ## Examples

      iex> delete_opening_hours(opening_hours)
      {:ok, %OpeningHour{}}

      iex> delete_opening_hours(opening_hours)
      {:error, %Ecto.Changeset{}}

  """
  def delete_opening_hours(%OpeningHour{} = opening_hours) do
    Repo.delete(opening_hours)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking opening_hours changes.

  ## Examples

      iex> change_opening_hours(opening_hours)
      %Ecto.Changeset{source: %OpeningHour{}}

  """
  def change_opening_hours(%OpeningHour{} = opening_hours) do
    OpeningHour.changeset(opening_hours, %{})
  end

  alias Myppe.Bookings.Admin

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

  @doc """
  Returns a list of timeslot->slot struct for use with a booking. When a timeslot
  is chosen that doesn't yet exist, a booking is made along with the timeslot
  and slot. Further requests for the same timeslot will create a new booking
  for that timeslot. Each timeslot should only allow a maximum of 5 bookings.
  """
  def available_timeslots(pharmacy, preferred_slots) do
    preferred_slots
    |> Enum.map(&(get_available_timeslots_for_day_and_time(pharmacy, &1)))
    |> Enum.filter(&(!is_nil(&1)))
  end

  def get_available_timeslots_for_day_and_time(pharmacy, slot) do
    if is_open_on_day(pharmacy, slot["day"]) do
      slot_date = get_date_of_next_occurrence_of_day(slot["day"])
      slot_times = get_slot_times(pharmacy, slot_date, slot)
    end
  end

  @doc """
  Checks if a pharmacy is open on a given day of the week, based on their
  opening hours
  """
  def is_open_on_day(%{opening_hours: opening_hours} = _pharmacy, day_num) do
    opening_hour =
      opening_hours
      |> Enum.filter(fn s -> s.day == day_num end )

    case opening_hour do
      [%{is_open: true}] ->
        true
      _ ->
        false
    end
  end

  @max_bookings_per_timeslot 5

  @doc """
  Gets details for available slot hours based on opening_hours and user
  selected slot preference
  """
  def get_slot_times(pharmacy, datetime, selected_slot) do
    slot_id = datetime_to_slot_id(datetime)
    timeslots_with_bookings= list_timeslots_with_bookings(pharmacy, slot_id)
    # 1..4
    # |> Enum.map(fn i
    #
    # end)
  end

  @doc """
  Takes a datetime and returns which quarter of the hour the time is (e.g.
  if the time is 10.00 - 10.14, it is the first quarter of the 10th hour, so 1 is
  returned. 10.43 returns 3).
  """
  def datetime_to_quarter(datetime) do
    datetime
    |> Timex.format!("%M", :strftime)
    |> String.to_integer()
    |> minute_to_quarter()
  end

  @doc """
  Takes the minute part of the time and tells us which quarter of the hour it
  is in
  """
  def minute_to_quarter(minute) do
    div(minute, 15) + 1
  end

  @doc """
  Takes a datetime and returns an id in the form YYYYMMDDHH
  """
  def datetime_to_slot_id(datetime) do
    datetime
    |> Timex.format!("%Y%m%d%H", :strftime)
  end

  @timex_num_to_day_num%{
    7 => 0,
    1 => 1,
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6

  }

  @day_num_to_timex_num %{
    0 => 7,
    1 => 1,
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6
  }

  def to_local_date(date) do
    Timex.Timezone.convert(date ,Timex.Timezone.local)
  end

  def get_date_of_next_occurrence_of_day(day_num) do
    todays_date = Timex.now() |> to_local_date()
    today = @timex_num_to_day_num[(todays_date |> Timex.weekday)]

    if day_num <= today do
      todays_date |> Timex.shift(days: 7 - (today - day_num))
    else
      todays_date |> Timex.shift(days: (day_num - today))
    end
  end

  @doc """
  Creates a slot for the pharmacy if it doesn't exist. Otherwise just return
  the existing one.
  """
  def create_or_get_slot(pharmacy, date, slot_id) do
    attrs = %{"slot_id" => slot_id, "date" => date, "pharmacy_id" => pharmacy.id}
    case get_slot(pharmacy, slot_id) do
      nil ->
        {:ok, slot} = create_slot(attrs)
        slot
      slot ->
        {:ok, slot}
    end
  end

  def create_or_get_timeslot(slot, quarter) do
    case get_timeslot(slot, quarter) do
      nil ->
        {:ok, timeslot} = create_timeslot(%{quarter: quarter, slot_id: slot.id})
      timeslot ->
        {:ok, timeslot}
    end
  end

  def extract_slot_details(slot_timeslot_id) do
    slot_id = slot_timeslot_id |> String.slice(0,10)
    quarter = slot_timeslot_id |> String.slice(10,1)
    year = slot_id |> String.slice(0,4) |> String.to_integer()
    month = slot_id |> String.slice(4,2) |> String.to_integer()
    day = slot_id |> String.slice(6,2) |> String.to_integer()
    {:ok, date} = NaiveDateTime.new(year, month, day, 0, 0, 0)
    {slot_id, quarter, date}
  end

  def create_booking(user, pharmacy_id, slot_timeslot_id, line_items) do
    {slot_id, quarter, date} = slot_timeslot_id |> extract_slot_details()
    pharmacy = Myppe.Bookings.get_pharmacy!(pharmacy_id)
    {:ok, slot} = create_or_get_slot(pharmacy, date, slot_id)
    {:ok, timeslot} = create_or_get_timeslot(slot, quarter)
    booking_attrs =
      %{
        "timeslot_id" => timeslot.id,
        "user_id" => user.id,
        "status" => "new",
        "line_items" => line_items
      }
    %Myppe.Bookings.Booking{}
    |> Myppe.Bookings.Booking.changeset(booking_attrs)
    |> Myppe.Repo.insert()
  end
end
