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
alias FeenixIntro.Accounts.User

# reset the datastore
Repo.delete_all(User) # this should also delete all Posts

# insert people
me  = Repo.insert!(%User{ name: "Bill", email: "bill@example.com", username: "bill" })
dog = Repo.insert!(%User{ name: "Nyima", email: "nyima@example.com", username: "nyima" })

post1 = Repo.insert!(%Post{ user_id: me.id, title: "Elixir", body: "Very cool ideas" })
post2 = Repo.insert!(%Post{ user_id: me.id, title: "Phoenix", body: "live is fascinating" })
post3 = Repo.insert!(%Post{ user_id: dog.id, title: "Walk", body: "Woo Hoo!" })
post4 = Repo.insert!(%Post{ user_id: dog.id, title: "Dinner", body: "Oh Yeh!" })
