defmodule FeenixIntro.Blogs do
  @moduledoc """
  The Blogs context.
  """

  import Ecto.Query, warn: false
  alias FeenixIntro.Repo

  alias FeenixIntro.Blogs.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  # def list_posts, do: Repo.all(Post)
  # def list_posts do
  #   Post
  #   |> Repo.all()
  #   |> Repo.preload(:user)
  # end
  # def list_posts(opts \\ [:user]) do
  def list_posts(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])
    Post
    |> Repo.all()
    |> Repo.preload(preloads)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  # def get_post!(id), do: Repo.get!(Post, id)
  # def get_post!(id) do
  #   Post
  #   |> Repo.get!(id)
  #   |> Repo.preload(:user)
  #   |> Repo.preload([comments: [:user]])
  #   # or more succintly:
  #   # |> Repo.preload([:user, comments: [:user]])
  # end
  # def get_post!(id, opts \\ []) do
  def get_post!(id, opts \\ [:user, comments: [:user]]) do
    preloads = Keyword.get(opts, :preloads, [])
    Post
    |> Repo.get!(id)
    |> Repo.preload(preloads)
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # this will work when we have the user logged in and present in the controller
  # def create_post(%User{} = user, attrs \\ %{}) do
  #   user
  #   |> Ecto.build_assoc(:post)
  #   |> Post.changeset(attrs)
  #   |> Repo.insert()
  # end
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  alias FeenixIntro.Blogs.Comment

  @doc """
  Returns the list of comments.

  ## Examples

      iex> list_comments()
      [%Comment{}, ...]

  """
  # def list_comment, do: Repo.all(Comment)
  # def list_comment do
  #   Comment
  #   |> Repo.all()
  #   |> Repo.preload(:user)
  # end
  # def list_comments(opts \\ []) do
  def list_comments(opts \\ [:user]) do
    preloads = Keyword.get(opts, :preloads, [])
    Comment
    |> Repo.all()
    |> Repo.preload(preloads)
  end

  @doc """
  Gets a single comment.

  Raises `Ecto.NoResultsError` if the Comment does not exist.

  ## Examples

      iex> get_comment!(123)
      %Comment{}

      iex> get_comment!(456)
      ** (Ecto.NoResultsError)

  """
  # def get_comment!(id), do: Repo.get!(Comment, id)
  def get_comment!(id) do
    Comment
    |> Repo.get!(id)
    |> Repo.preload(:user)
  end

  @doc """
  Creates a comment.

  ## Examples
      # replace
      # iex> create_comment(%{field: value})
      # with
      iex> create_comment(post, %{field: value})
      {:ok, %Comment{}}

      # replace:
      # iex> create_comment(%{field: bad_value})
      # with:
      iex> create_comment(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # replace
  # def create_comment(attrs \\ %{}) do
  #   %Comment{}
  #   |> Comment.changeset(attrs)
  #   |> Repo.insert()
  # end

  # with (this uses the passed in post and creates an association with the new comment)
  def create_comment(%Post{} = post, attrs \\ %{}) do
    post
    |> Ecto.build_assoc(:comments)
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comment.

  ## Examples

      iex> update_comment(comment, %{field: new_value})
      {:ok, %Comment{}}

      iex> update_comment(comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a comment.

  ## Examples

      iex> delete_comment(comment)
      {:ok, %Comment{}}

      iex> delete_comment(comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.

  ## Examples

      iex> change_comment(comment)
      %Ecto.Changeset{data: %Comment{}}

  """
  def change_comment(%Comment{} = comment, attrs \\ %{}) do
    Comment.changeset(comment, attrs)
  end
end
