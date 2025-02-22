defmodule MyppeWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use MyppeWeb, :controller

  def call(conn, {:error, message}) when is_bitstring(message) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(MyppeWeb.ErrorView)
    |> render("error.json", message: message)
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(MyppeWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(MyppeWeb.ErrorView)
    |> render(:"404.json")
  end
end
