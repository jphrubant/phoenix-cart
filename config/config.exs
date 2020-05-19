# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cart,
  ecto_repos: [Cart.Repo]

# Configures the endpoint
config :cart, CartWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uTpIm6jNhT/M4m6urMVP5V8FQgrrPtT35CQR0S6FRh42iH9kxY4XWOfK0BW2AHZy",
  render_errors: [view: CartWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Cart.PubSub,
  live_view: [signing_salt: "HpNVvRHt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
