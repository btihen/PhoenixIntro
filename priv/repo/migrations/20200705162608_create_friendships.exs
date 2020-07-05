defmodule FeenixIntro.Repo.Migrations.CreateFriendships do
  use Ecto.Migration

  def change do
    create table(:friendships) do
      add :user_id, references(:users, on_delete: :nothing)
      add :friend_id, references(:users, on_delete: :nothing)

      # can't do this whith multiple freference ids
      # add :user_id, references(:users, on_delete: :delete_all), null: false
      # add :friend_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:friendships, [:user_id])
    create index(:friendships, [:friend_id])
  end
end
