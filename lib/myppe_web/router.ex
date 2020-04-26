defmodule MyppeWeb.Router do
  use MyppeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyppeWeb do
    pipe_through :api
  end
end
