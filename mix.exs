defmodule Farm.MixProject do
  use Mix.Project

  def project do
    [
      app: :farm,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :trot],
      mod: {Farm.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 2.0"},
      {:postgrex, "~> 0.11"},
      {:trot, github: "hexedpackets/trot"},
      {:plug_cowboy, "~> 1.0"}
    ]
  end
end
