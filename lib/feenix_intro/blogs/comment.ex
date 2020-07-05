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
    |> validate_length(:message, min: 3)
    # |> validate_length(:message, min: 3, max: 900)
    # |> validate_not_nil(@required_fields)
  end

  # not needed anymore - but interesting way to chech for nils
  # https://stackoverflow.com/questions/45754213/how-to-make-ecto-changeset-validate-required-accept-blank-values
  def validate_not_nil(changeset, fields) do
    Enum.reduce(fields, changeset, fn field, changeset ->
      if get_field(changeset, field) == nil do
        add_error(changeset, field, "nil")
      else
        changeset
      end
    end)
  end

end
