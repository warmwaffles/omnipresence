defmodule Omnipresence.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :omnipresence,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A protocol for presence checking",
      dialyzer: dialyzer(),
      docs: docs(),
      name: "Omnipresence",
      package: package(),
      source_url: "https://github.com/warmwaffles/omnipresence",
      homepage_url: "https://github.com/warmwaffles/omnipresence"
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.2.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end

  defp dialyzer do
    [
      plt_add_deps: :apps_direct
    ]
  end

  defp docs_extras do
    [
      "README.md": [title: "Readme"],
      "CHANGELOG.md": []
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: docs_extras(),
      source_ref: "v#{@version}",
      source_url: "https://github.com/warmwaffles/omnipresence"
    ]
  end

  defp package do
    [
      files: ~w(
        lib
        mix.exs
        README.md
        CHANGELOG.md
        LICENSE
      ),
      name: "omnipresence",
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/warmwaffles/omnipresence",
        "Changelog" => "https://github.com/warmwaffles/omnipresence/blob/main/CHANGELOG.md"
      }
    ]
  end
end
