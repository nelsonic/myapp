# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :myapp,
  ecto_repos: [Myapp.Repo]

# Configures the endpoint
config :myapp, Myapp.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B5KbU/YXwS4woQrsznSlBo3EPGiILfTZRv73/bHD2E91/qNyDai6kWvnKGtPBRBm",
  render_errors: [view: Myapp.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Myapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Myapp.User,
  repo: Myapp.Repo,
  module: Myapp,
  router: Myapp.Web.Router,
  messages_backend: Myapp.Coherence.Messages,
  logged_out_url: "/",
  opts: [:authenticatable]
# %% End Coherence Configuration %%
