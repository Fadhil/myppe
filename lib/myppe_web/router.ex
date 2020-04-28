defmodule MyppeWeb.Router do
  use MyppeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyppeWeb do
    pipe_through :api
    resources "/users", UserController, only: [:create, :show]
    resources "/admins", AdminController, only: [:create, :show]
  end
end
