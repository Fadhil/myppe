defmodule Myppe.Repo do
  use Ecto.Repo,
    otp_app: :myppe,
    adapter: Ecto.Adapters.MyXQL
end
