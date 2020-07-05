defmodule FeenixIntro.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias FeenixIntro.Repo

  alias FeenixIntro.Accounts.User

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
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias FeenixIntro.Accounts.Friendship

  @doc """
  Returns the list of friendships.

  ## Examples

      iex> list_friendships()
      [%Friendship{}, ...]

  """
  def list_friendships do
    Repo.all(Friendship)
  end

  @doc """
  Gets a single friendship.

  Raises `Ecto.NoResultsError` if the Friendship does not exist.

  ## Examples

      iex> get_friendship!(123)
      %Friendship{}

      iex> get_friendship!(456)
      ** (Ecto.NoResultsError)

  """
  def get_friendship!(id), do: Repo.get!(Friendship, id)

  @doc """
  Creates a friendship.

  ## Examples

      iex> create_friendship(%{field: value})
      {:ok, %Friendship{}}

      iex> create_friendship(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_friendship(attrs \\ %{}) do
    %Friendship{}
    |> Friendship.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a friendship.

  ## Examples

      iex> update_friendship(friendship, %{field: new_value})
      {:ok, %Friendship{}}

      iex> update_friendship(friendship, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_friendship(%Friendship{} = friendship, attrs) do
    friendship
    |> Friendship.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a friendship.

  ## Examples

      iex> delete_friendship(friendship)
      {:ok, %Friendship{}}

      iex> delete_friendship(friendship)
      {:error, %Ecto.Changeset{}}

  """
  def delete_friendship(%Friendship{} = friendship) do
    Repo.delete(friendship)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking friendship changes.

  ## Examples

      iex> change_friendship(friendship)
      %Ecto.Changeset{data: %Friendship{}}

  """
  def change_friendship(%Friendship{} = friendship, attrs \\ %{}) do
    Friendship.changeset(friendship, attrs)
  end
end
