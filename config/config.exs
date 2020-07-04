# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :feenix_intro,
  ecto_repos: [FeenixIntro.Repo]

# Configures the endpoint
config :feenix_intro, FeenixIntroWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PuahyG/sNaknpqz03xcFrgr7FdkNRVA+JbNZwISTgNFcXMTDnLbNF2kokPx1H1U8",
  render_errors: [view: FeenixIntroWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FeenixIntro.PubSub,
  live_view: [signing_salt: "vrrJKwDE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
