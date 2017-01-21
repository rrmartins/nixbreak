defmodule Nixbreak.ErrjobController do
  use Nixbreak.Web, :controller

  alias Nixbreak.Errjob

  def index(conn, _params) do
    errjobs = Repo.all(Errjob)
    render(conn, "index.html", errjobs: errjobs)
  end

  def new(conn, _params) do
    changeset = Errjob.changeset(%Errjob{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, errjob_params) do
    require IEx; IEx.pry
    changeset = Errjob.changeset(%Errjob{}, errjob_params)

    case Repo.insert(changeset) do
      {:ok, errjob} ->
        render conn, "index.json", changeset: errjob, message: "Errjob created successfully."
      {:error, changeset} ->
        render conn, "error.json", changeset: changeset, message: "Errjob not created."
    end
  end

  def show(conn, %{"id" => id}) do
    errjob = Repo.get!(Errjob, id)
    render(conn, "show.html", errjob: errjob)
  end

  def edit(conn, %{"id" => id}) do
    errjob = Repo.get!(Errjob, id)
    changeset = Errjob.changeset(errjob)
    render(conn, "edit.html", errjob: errjob, changeset: changeset)
  end

  def update(conn, %{"id" => id, "errjob" => errjob_params}) do
    errjob = Repo.get!(Errjob, id)
    changeset = Errjob.changeset(errjob, errjob_params)

    case Repo.update(changeset) do
      {:ok, errjob} ->
        conn
        |> put_flash(:info, "Errjob updated successfully.")
        |> redirect(to: errjob_path(conn, :show, errjob))
      {:error, changeset} ->
        render(conn, "edit.html", errjob: errjob, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    errjob = Repo.get!(Errjob, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(errjob)

    conn
    |> put_flash(:info, "Errjob deleted successfully.")
    |> redirect(to: errjob_path(conn, :index))
  end
end
