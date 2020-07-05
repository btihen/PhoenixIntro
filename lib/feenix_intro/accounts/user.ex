defmodule FeenixIntro.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias FeenixIntro.Blogs.Post
  alias FeenixIntro.Accounts.Friendship

  @required_fields [:name, :email, :username]

  schema "users" do
    has_many(:posts, Post)
    has_many(:friendships, Friendship)
    has_many(:friends, through: [:friendships, :friend])

    field :name, :string
    field :email, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:username)
  end
end
