defmodule SRHub.Router do
  use SRHub.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :open_api do
    plug :accepts, ["json"]
  end

  pipeline :secure_api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", SRHub do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/", SRHub do
    pipe_through :secure_api

    post "/signup", UserController, :signup
  end

  scope "/api", SRHub do
    pipe_through :open_api

    resources "/users", UserController, only: [:create]
    resources "/sessions", SessionController, only: [:create]
  end
end
