defmodule Adapt.Mixfile do
  use Mix.Project

  def project do
    [app: :adapt,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package()]
  end

  def application do
    [applications: [:logger, :porcelain],
     mod: {Adapt, []}]
  end

  defp deps do
    [{:porcelain, "~> 2.0.2"},
     {:poison, "~> 2.0"}]
  end

  defp package do
    [# These are the default files included in the package
     name: :adapt,
     files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Kevin Anderson"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/bka9/elixir-adapt"}]
  end
end
