defmodule Nixbreak.Repo.Migrations.CreateErrjob do
  use Ecto.Migration

  def change do
    create table(:errjobs) do
      add :solved, :boolean, default: false, null: false
      add :namejob, :string
      add :error, :string
      add :client_id, references(:clients, on_delete: :nothing)

      timestamps()
    end
    create index(:errjobs, [:client_id])

  end
end
