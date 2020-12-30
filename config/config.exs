# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hoge,
  ecto_repos: [Hoge.Repo]

# Configures the endpoint
config :hoge, HogeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rf7EArGM8b6VH4eQswQSt0IG7IfEq91kozwnt4N6OF2pDcPGVnhX4hKeG+g+mVy0",
  render_errors: [view: HogeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hoge.PubSub,
  live_view: [signing_salt: "L4Qd85+A"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
