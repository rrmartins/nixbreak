defmodule Nixbreak.Errjob do
  use Nixbreak.Web, :model

  schema "errjobs" do
    field :solved, :boolean, default: false
    field :namejob, :string
    field :error, :string
    belongs_to :client, Nixbreak.Client

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:namejob, :error, :client_id])
    |> validate_required([:namejob, :error, :client_id])
  end
end
