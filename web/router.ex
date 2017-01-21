defmodule Nixbreak.Router do
  use Nixbreak.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
  end

  # Add this block
  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  # Add this block
  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Nixbreak do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/", Nixbreak do
    pipe_through :protected

    resources "/errjobs", ErrjobController
    resources "/clients", ClientController
  end

  # Other scopes may use custom stacks.
  scope "/api", Nixbreak do
    pipe_through :api

    post "/post_error", ErrjobController, :create
  end
end
