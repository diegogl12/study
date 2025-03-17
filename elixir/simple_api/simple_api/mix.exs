defmodule SimpleApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_api,
      version: "0.1.0",
      elixir: "~> 1.18-rc",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SimpleApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.2.1"},
      {:jason, "~> 1.2.0"}
    ]
  end
end
