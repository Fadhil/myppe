# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :myppe,
  ecto_repos: [Myppe.Repo]

# Configures the endpoint
config :myppe, MyppeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/COBgBBkGjmDPYman361i7IHQCamMuIFpZqgpr8MeEQZzPfob7Niq97Np2F2DX6U",
  render_errors: [view: MyppeWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Myppe.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :cors_plug,
  origin: ["http://localhost", "*"],
  max_age: 86400,
  methods: ["GET", "POST", "PUT", "DELETE"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
