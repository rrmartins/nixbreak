defmodule Nixbreak.ErrjobTest do
  use Nixbreak.ModelCase

  alias Nixbreak.Errjob

  @valid_attrs %{error: "some content", namejob: "some content", solved: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Errjob.changeset(%Errjob{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Errjob.changeset(%Errjob{}, @invalid_attrs)
    refute changeset.valid?
  end
end
