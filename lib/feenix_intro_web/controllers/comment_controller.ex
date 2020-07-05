defmodule FeenixIntroWeb.CommentController do
  use FeenixIntroWeb, :controller

  alias FeenixIntro.Blogs
  alias FeenixIntro.Accounts

  def create(conn, %{"post_id" => post_id, "comment" => comment_params}) do
    post = Blogs.get_post!(post_id)
    case Blogs.create_comment(post, comment_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Comment created")
        |> redirect(to: Routes.post_path(conn, :show, post))

      # to handle errors - replace
      # {:error, _changeset} ->
      #   conn
      #   |> put_flash(:error, "Comment creation failed, please fix the errors")
      #   |> redirect(to: Routes.post_path(conn, :show, post))

      # with:
      {:error, %Ecto.Changeset{} = changeset} ->
        users = Accounts.list_users()
        conn
        |> put_flash(:error, "Comment creation failed, please fix the errors")
        |> put_view(FeenixIntroWeb.PostView)  # as of Phoenix 1.5.1
        |> render("show.html", post: post, users: users, comment_changeset: changeset)
    end
  end

end