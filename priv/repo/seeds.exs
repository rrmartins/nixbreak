# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Nixbreak.Repo.insert!(%Nixbreak.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Nixbreak.User.changeset(%Nixbreak.User{}, %{name: "nixbreakjob", email: "nixjob@example.com", password: "123qwe", password_confirmation: "123qwe"})
|> Nixbreak.Repo.insert!

# Nixbreak.Client.changeset(%Nixbreak.Client{}, %{name: "client1", email: "vafe@example.com", active: true})
# |> Nixbreak.Repo.insert!
