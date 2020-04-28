defmodule MyppeWeb.Router do
  use MyppeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticate do
    plug Myppe.Auth.Plugs.Authentication
  end

  scope "/api", MyppeWeb do
    pipe_through :api
    resources "/users", UserController, only: [:create, :show]
    resources "/login", UserSessionController, only: [:create, :show]
  end

  scope "/api", MyppeWeb do
    pipe_through [:api, :authenticate]
  end

  scope "/api/admin", MyppeWeb do
    pipe_through :api
    resources "/users", AdminController, only: [:create, :show]
  end
end
