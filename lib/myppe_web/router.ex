defmodule MyppeWeb.Router do
  use MyppeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticate_admin do
    plug Myppe.Auth.Plugs.AuthenticateAdmin
  end

  pipeline :authenticate_user do
    plug Myppe.Auth.Plugs.AuthenticateUser
  end

  scope "/api", MyppeWeb do
    pipe_through :api
    resources "/users", UserController, only: [:create, :show]
    resources "/login", UserSessionController, only: [:create, :show]
  end

  scope "/api", MyppeWeb do
    pipe_through [:api, :authenticate_user]
    resources "/search", SearchController, only: [:create, :index]
  end


  scope "/api/admin", MyppeWeb.Admin do
    pipe_through :api
    resources "/users", AdminController, only: [:create, :show]
    resources "/login", AdminSessionController, only: [:create, :show]
  end

  scope "/api/admin", MyppeWeb.Admin do
    pipe_through [:api, :authenticate_admin]
    get "/inventory", InventoryController, :index
    put "/inventory", InventoryController, :update
  end
end
