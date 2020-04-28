import Config

config :myppe, Myppe.Endpoint,
  server: true,
  http: [port: 4000],
  url: [host: "jimatbiz.com", port: 443]
