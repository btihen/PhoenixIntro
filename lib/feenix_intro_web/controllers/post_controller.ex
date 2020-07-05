defmodule FeenixIntroWeb.PostController do
  use FeenixIntroWeb, :controller

  alias FeenixIntro.Blogs
  alias FeenixIntro.Blogs.Post
  alias FeenixIntro.Blogs.Comment
  # alias FeenixIntro.Blogs.{Post, Comment}
  alias FeenixIntro.Accounts
  # alias FeenixIntro.Accounts.User

  def index(conn, _params) do
    # posts = Blogs.list_posts()
    preloads = [:user]
    posts = Blogs.list_posts(preloads: preloads)
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    users = Accounts.list_users()
    changeset = Blogs.change_post(%Post{})
    render(conn, "new.html", changeset: changeset, users: users)
  end

  def create(conn, %{"post" => post_params}) do
    case Blogs.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    # post = Blogs.get_post!(id)
    preloads = [:user, comments: [:user]]
    post = Blogs.get_post!(id, preloads: preloads)
    users = Accounts.list_users()
    # This allows us to add comments on the Post show form!
    comment_changeset = Blogs.change_comment(%Comment{})
    render(conn, "show.html", post: post,
                              users: users,
                              comment_changeset: comment_changeset)
  end

  def edit(conn, %{"id" => id}) do
    post = Blogs.get_post!(id)
    users = Accounts.list_users()
    changeset = Blogs.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset, users: users)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blogs.get_post!(id)

    case Blogs.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Blogs.get_post!(id)
    {:ok, _post} = Blogs.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
