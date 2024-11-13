defmodule ExLister.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_lister,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        # Главный модуль
        main: "ExLister",
        extras: ["README.md"],
        groups_for_modules: [
          Core: [ExLister],
          Protocols: [ExLister.Protocol.Lister],
          Behaviours: [
            ExLister.Behaviour.ListerBehaviour,
            ExLister.Behaviour.IntegerLister,
            ExLister.Behaviour.StringLister,
            ExLister.Behaviour.MapLister
          ]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.31", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
