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
end
