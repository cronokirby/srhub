# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :srhub,
  namespace: SRHub,
  ecto_repos: [SRHub.Repo]

# Configures the endpoint
config :srhub, SRHub.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "P15N8aoleunFHe4WyPzXO3jq8XmkPySf8Z8nYGm4Jt/k2Wyn9/kn41EsFviXbU+L",
  render_errors: [view: SRHub.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SRHub.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
