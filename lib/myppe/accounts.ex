defmodule Myppe.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Myppe.Repo

  alias Myppe.Accounts.User

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
  Get User by email
  """
  def get_user_by_email(email), do: Repo.get_by(User, %{email: email})

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
    |> User.registration_changeset(attrs)
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

  alias Myppe.Accounts.Admin

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
  Creates a admin if the registration changeset is valid.
  This also creates a pharmacy with an inventory for the admin.

  ## Examples

      iex> create_admin(%{field: value})
      {:ok, %Admin{}}

      iex> create_admin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_admin(attrs \\ %{}) do
    admin = %Admin{}
    |> Admin.registration_changeset(attrs)
    case admin.valid? do
      true ->
        admin_attrs =
          admin.changes
          |> Admin.map_to_nested_admin_attrs()
        res =
          %Admin{}
          |> Admin.create_changeset(admin_attrs)
        Repo.insert(res)
      false ->
        {:error, admin}
    end
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

  alias Myppe.Accounts.Pharmacy

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

  alias Myppe.Accounts.Inventory

  @doc """
  Returns the list of inventories.

  ## Examples

      iex> list_inventories()
      [%Inventory{}, ...]

  """
  def list_inventories do
    Repo.all(Inventory)
  end

  @doc """
  Gets a single inventory.

  Raises `Ecto.NoResultsError` if the Inventory does not exist.

  ## Examples

      iex> get_inventory!(123)
      %Inventory{}

      iex> get_inventory!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inventory!(id), do: Repo.get!(Inventory, id)

  @doc """
  Creates a inventory.

  ## Examples

      iex> create_inventory(%{field: value})
      {:ok, %Inventory{}}

      iex> create_inventory(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inventory(attrs \\ %{}) do
    %Inventory{}
    |> Inventory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inventory.

  ## Examples

      iex> update_inventory(inventory, %{field: new_value})
      {:ok, %Inventory{}}

      iex> update_inventory(inventory, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inventory(%Inventory{} = inventory, attrs) do
    inventory
    |> Inventory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inventory.

  ## Examples

      iex> delete_inventory(inventory)
      {:ok, %Inventory{}}

      iex> delete_inventory(inventory)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inventory(%Inventory{} = inventory) do
    Repo.delete(inventory)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inventory changes.

  ## Examples

      iex> change_inventory(inventory)
      %Ecto.Changeset{source: %Inventory{}}

  """
  def change_inventory(%Inventory{} = inventory) do
    Inventory.changeset(inventory, %{})
  end

  alias Myppe.Accounts.OpeningHour

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
  Gets a single opening_hour.

  Raises `Ecto.NoResultsError` if the Opening hour does not exist.

  ## Examples

      iex> get_opening_hour!(123)
      %OpeningHour{}

      iex> get_opening_hour!(456)
      ** (Ecto.NoResultsError)

  """
  def get_opening_hour!(id), do: Repo.get!(OpeningHour, id)

  @doc """
  Creates a opening_hour.

  ## Examples

      iex> create_opening_hour(%{field: value})
      {:ok, %OpeningHour{}}

      iex> create_opening_hour(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_opening_hour(attrs \\ %{}) do
    %OpeningHour{}
    |> OpeningHour.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a opening_hour.

  ## Examples

      iex> update_opening_hour(opening_hour, %{field: new_value})
      {:ok, %OpeningHour{}}

      iex> update_opening_hour(opening_hour, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_opening_hour(%OpeningHour{} = opening_hour, attrs) do
    opening_hour
    |> OpeningHour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a opening_hour.

  ## Examples

      iex> delete_opening_hour(opening_hour)
      {:ok, %OpeningHour{}}

      iex> delete_opening_hour(opening_hour)
      {:error, %Ecto.Changeset{}}

  """
  def delete_opening_hour(%OpeningHour{} = opening_hour) do
    Repo.delete(opening_hour)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking opening_hour changes.

  ## Examples

      iex> change_opening_hour(opening_hour)
      %Ecto.Changeset{source: %OpeningHour{}}

  """
  def change_opening_hour(%OpeningHour{} = opening_hour) do
    OpeningHour.changeset(opening_hour, %{})
  end
end
