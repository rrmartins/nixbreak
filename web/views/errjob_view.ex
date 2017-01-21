defmodule Nixbreak.ErrjobView do
  use Nixbreak.Web, :view

  def render("index.json", %{errjob: errjob, message: message}) do
    %{
      namejob: errjob.namejob,
      inserted_at: errjob.inserted_at,
      updated_at: errjob.updated_at,
      message: message
    }
  end
  
  def render("error.json", %{changeset: changeset, message: message}) do
    errors = Enum.map(changeset.errors, fn {field, detail} ->
      %{
        source: %{ pointer: "/data/attributes/#{field}" },
        title: "Invalid Attribute",
        detail: render_detail(detail)
      }
    end)

    %{errors: errors, message: message}
  end

  def render_detail({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end

  def render_detail(message) do
    message
  end


end
