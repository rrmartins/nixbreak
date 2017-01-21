defmodule Nixbreak.PageController do
  use Nixbreak.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
