defmodule FeenixIntro.Accounts.Friendship do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ideas.Account.User
  alias Ideas.Account.Friendship

  @required_fields [:user_id, :friend_id]

  schema "friendships" do
    belongs_to(:user, User)
    belongs_to(:friend, Friend)
    # field :user_id, :id
    # field :friend_id, :id

    timestamps()
  end

  @doc false
  def changeset(friendship, attrs) do
    friendship
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
