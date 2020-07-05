defmodule FeenixIntroWeb.CommentController do
  use FeenixIntroWeb, :controller

  alias FeenixIntro.Blogs

  def create(conn, %{"post_id" => post_id, "comment" => comment_params}) do
    post = Blogs.get_post!(post_id)
    case Blogs.create_comment(post, comment_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Comment created")
        |> redirect(to: Routes.post_path(conn, :show, post))
      # TODO: return to form and show errors
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Comment creation failed")
        |> redirect(to: Routes.post_path(conn, :show, post))
    end
  end

end