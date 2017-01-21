defmodule Nixbreak.ErrjobControllerTest do
  use Nixbreak.ConnCase

  alias Nixbreak.Errjob
  @valid_attrs %{error: "some content", namejob: "some content", solved: true}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, errjob_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing errjobs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, errjob_path(conn, :new)
    assert html_response(conn, 200) =~ "New errjob"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, errjob_path(conn, :create), errjob: @valid_attrs
    assert redirected_to(conn) == errjob_path(conn, :index)
    assert Repo.get_by(Errjob, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, errjob_path(conn, :create), errjob: @invalid_attrs
    assert html_response(conn, 200) =~ "New errjob"
  end

  test "shows chosen resource", %{conn: conn} do
    errjob = Repo.insert! %Errjob{}
    conn = get conn, errjob_path(conn, :show, errjob)
    assert html_response(conn, 200) =~ "Show errjob"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, errjob_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    errjob = Repo.insert! %Errjob{}
    conn = get conn, errjob_path(conn, :edit, errjob)
    assert html_response(conn, 200) =~ "Edit errjob"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    errjob = Repo.insert! %Errjob{}
    conn = put conn, errjob_path(conn, :update, errjob), errjob: @valid_attrs
    assert redirected_to(conn) == errjob_path(conn, :show, errjob)
    assert Repo.get_by(Errjob, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    errjob = Repo.insert! %Errjob{}
    conn = put conn, errjob_path(conn, :update, errjob), errjob: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit errjob"
  end

  test "deletes chosen resource", %{conn: conn} do
    errjob = Repo.insert! %Errjob{}
    conn = delete conn, errjob_path(conn, :delete, errjob)
    assert redirected_to(conn) == errjob_path(conn, :index)
    refute Repo.get(Errjob, errjob.id)
  end
end
