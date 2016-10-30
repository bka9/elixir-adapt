defmodule Adapt.Mixfile do
  use Mix.Project

  def project do
    [app: :adapt,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     deps: deps(),
     package: package()]
  end

  def application do
    [applications: [:logger, :porcelain],
     mod: {Adapt, []}]
  end

  defp deps do
    [{:porcelain, "~> 2.0.2"},
     {:poison, "~> 2.0"},
     {:ex_doc, "~> 0.12", only: :dev}]
  end

  defp description do
    """
     A wrapper of the Adapt Python Project. It allows the processing of user input to extract intentions in a machine readable way.
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :adapt,
     files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Kevin Anderson"],
     licenses: ["GNU GPLv3"],
     links: %{"GitHub" => "https://github.com/bka9/elixir-adapt"}]
  end
end
