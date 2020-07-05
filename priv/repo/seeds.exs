# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FeenixIntro.Repo.insert!(%FeenixIntro.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FeenixIntro.Repo
alias FeenixIntro.Blogs.Post
alias FeenixIntro.Blogs.Comment
alias FeenixIntro.Accounts.User
alias FeenixIntro.Accounts.Friendship

# reset the datastore
Repo.delete_all(User) # this should also delete all Posts

# insert users
me  = Repo.insert!(%User{ name: "Bill", email: "bill@example.com", username: "bill" })
dog = Repo.insert!(%User{ name: "Nyima", email: "nyima@example.com", username: "nyima" })
cat = Repo.insert!(%User{ name: "Cat", email: "cat@example.com", username: "cat" })

# create posts
post1 = Repo.insert!(%Post{ user_id: me.id, title: "Elixir", body: "Very cool ideas" })

# post2 = Repo.insert!(%Post{ user_id: me.id, title: "Phoenix", body: "live is fascinating" })
post2 = me
        |> Ecto.build_assoc(:posts)
        |> Post.changeset(%{ user_id: me.id, title: "Phoenix", body: "live is fascinating" })
        |> Repo.insert!()

post3 = Repo.insert!(%Post{ user_id: dog.id, title: "Walk", body: "Woo Hoo!" })

Repo.insert!(%Post{ user_id: dog.id, title: "Dinner", body: "Oh Yeh!" })

# add comments
Repo.insert!(%Comment{user_id: dog.id, post_id: post1.id, message: "woof" })

post2
|> Ecto.build_assoc(:comments)
|> Comment.changeset(%{ user_id: dog.id, post_id: post2.id, message: "BARK" })
|> Repo.insert!()

post3
|> Ecto.build_assoc(:comments)
|> Comment.changeset(%{ user_id: cat.id, post_id: post3.id, message: "Yaaawn" })
|> Repo.insert!()

# insert relationships
Repo.insert!(%Friendship{ user_id: me.id, friend_id: dog.id })
# me
# |> Ecto.build_assoc(:friendships)
# |> Friendship.changeset( %{ user_id: me.id, friend_id: dog.id } )
# |> Repo.insert

me
|> Ecto.build_assoc(:friendships)
|> Friendship.changeset( %{ user_id: me.id, friend_id: cat.id } )
|> Repo.insert

dog
|> Ecto.build_assoc(:friendships)
|> Friendship.changeset( %{ user_id: dog.id, friend_id: me.id } )
|> Repo.insert

dog
|> Ecto.build_assoc(:friendships)
|> Friendship.changeset( %{ user_id: dog.id, friend_id: cat.id } )
|> Repo.insert

cat
|> Ecto.build_assoc(:friendships)
|> Friendship.changeset( %{ user_id: cat.id, friend_id: me.id } )
|> Repo.insert
