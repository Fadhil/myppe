defmodule Myppe.Auth do
  @moduledoc """
  The Auth context.
  """

  import Ecto.Query, warn: false
  alias Myppe.Repo

  alias Myppe.Auth.User

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
  Gets a single user by email
  """
  def get_user_by_email!(email), do: Repo.get_by!(User, email: email)

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

  alias Myppe.Auth.Admin

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

  alias Myppe.Auth.UserSession

  @doc """
  Returns the list of user_sessions.

  ## Examples

      iex> list_user_sessions()
      [%UserSession{}, ...]

  """
  def list_user_sessions do
    Repo.all(UserSession)
  end

  @doc """
  Gets a single user_session.

  Raises `Ecto.NoResultsError` if the User session does not exist.

  ## Examples

      iex> get_user_session!(123)
      %UserSession{}

      iex> get_user_session!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_session!(id), do: Repo.get!(UserSession, id)

  @doc """
  Creates a user_session.

  ## Examples

      iex> create_user_session(%{field: value})
      {:ok, %UserSession{}}

      iex> create_user_session(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_session(attrs \\ %{}) do
    %UserSession{}
    |> UserSession.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_session.

  ## Examples

      iex> update_user_session(user_session, %{field: new_value})
      {:ok, %UserSession{}}

      iex> update_user_session(user_session, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_session(%UserSession{} = user_session, attrs) do
    user_session
    |> UserSession.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_session.

  ## Examples

      iex> delete_user_session(user_session)
      {:ok, %UserSession{}}

      iex> delete_user_session(user_session)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_session(%UserSession{} = user_session) do
    Repo.delete(user_session)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_session changes.

  ## Examples

      iex> change_user_session(user_session)
      %Ecto.Changeset{source: %UserSession{}}

  """
  def change_user_session(%UserSession{} = user_session) do
    UserSession.changeset(user_session, %{})
  end
end
