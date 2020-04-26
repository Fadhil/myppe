use Mix.Config

# Configure your database
config :myppe, Myppe.Repo,
  username: "root",
  password: "",
  database: "myppe_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :myppe, MyppeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
