defmodule FeenixIntro.Blogs.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias FeenixIntro.Blogs.Post
  alias FeenixIntro.Blogs.Comment
  alias FeenixIntro.Accounts.User

  @required_fields [:user_id, :title, :body]

  schema "posts" do
    belongs_to(:user, User)
    has_many(:comments, Comment)

    field :body, :string
    field :title, :string
    # field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
