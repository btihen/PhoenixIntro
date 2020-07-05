defmodule FeenixIntro.Blogs.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias FeenixIntro.Blogs.Post
  alias FeenixIntro.Accounts.User

  @required_fields [:user_id, :post_id, :message]

  schema "comments" do
    # field :post_id, :id
    # field :user_id, :id
    belongs_to(:user, User)
    belongs_to(:post, Post)
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
