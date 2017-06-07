defmodule Myapp.Web.Router do
  use Myapp.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :public do
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug Coherence.Authentication.Session, protected: true
  end

  scope "/" do
    pipe_through [:browser, :public]
    coherence_routes()
  end

  scope "/" do
    pipe_through [:browser, :protected]
    coherence_routes :protected
  end

  scope "/", Myapp.Web do
    pipe_through [:browser, :public]

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Myapp.Web do
  #   pipe_through :api
  # end
end
