defmodule GitIgnore.MixProject do
  use Mix.Project

  def project do
    [
      app: :gitignore,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:httpoison, "~> 1.6"}
    ]
  end

  defp escript do
    [
      main_module: GitIgnore.CLI
    ]
  end
end
