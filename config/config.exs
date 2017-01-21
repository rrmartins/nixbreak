# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :nixbreak,
  ecto_repos: [Nixbreak.Repo]

# Configures the endpoint
config :nixbreak, Nixbreak.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kIj7L49kaGFxMAQdbo85WJ4APa5P8V5z72hCdlrwRiLZTl+zpMEeUMgC0XRgVWEo",
  render_errors: [view: Nixbreak.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nixbreak.PubSub,
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
  user_schema: Nixbreak.User,
  repo: Nixbreak.Repo,
  module: Nixbreak,
  logged_out_url: "/",
  email_from_name: "Rodrigo Martins",
  email_from_email: "rrmartinsjg@gmail.com",
  opts: [:trackable, :invitable, :rememberable, :authenticatable, :recoverable, :lockable, :unlockable_with_token, :registerable]

config :coherence, Nixbreak.Coherence.Mailer,
  adapter: Swoosh.Adapters.Local
  # api_key: "your api key here"
# %% End Coherence Configuration %%
