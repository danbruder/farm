# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config
config :trot, :router, FarmWeb.Router

config :farm, ecto_repos: [Farm.Repo]

config :farm, Farm.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "farm_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
