# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :oauth,
  ecto_repos: [Oauth.Repo]

# Configures the endpoint
config :oauth, OauthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fa44YSx7YEgmutVvDQnyanAUwqvRhVMm24qZNKoWQw+zqGVYLybrzXVFuDCFkyMy",
  render_errors: [view: OauthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Oauth.PubSub,
  live_view: [signing_salt: "/YSfhw8O"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :oauth, Oauth.UserManager.Guardian,
  issuer: "oaut",
  secret_key: "IEwjj8SE5v2COo5Rq0dR1ZXIUIAPnFSJljzPBzA+nXILuJkRYhmCv63yxrrqowVu"
