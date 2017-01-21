defmodule Nixbreak.Client do
  use Nixbreak.Web, :model

  schema "clients" do
    field :name, :string
    field :email, :string
    field :active, :boolean, default: false
    has_many :errjob, Nixbreak.Errjob

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :active])
    |> validate_required([:name, :email, :active])
  end
end
