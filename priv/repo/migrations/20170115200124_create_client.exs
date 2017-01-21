defmodule Nixbreak.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :email, :string
      add :active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
