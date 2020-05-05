defmodule GitIgnore.CLI do
  @moduledoc """
  Simple CLI tool for fetching .gitignore files from GitHub's gitignore collection.
  You can fetch a bunch of languages or frameworks, and 
  GitIgnore.CLI will output to a file (defaults to .gitignore).
  """

  def main(args \\ []) do
    args
    |> parse_args()
    |> response()
  end

  defp parse_args(args) do
    {opts, languages, _} =
      args
      |> OptionParser.parse(switches: [output: :string])

    {opts, languages}
  end

  defp response({_opts, []}) do
    IO.puts(
      IO.ANSI.yellow() <>
        "Please select language or framework to fetch (e.g, `ruby`)" <> IO.ANSI.reset()
    )
  end

  defp response({opts, languages}) do
    output_path =
      opts
      |> Keyword.get(:output, '.gitignore')

    GitIgnore.Task.run(languages, output_path)

    IO.puts(
      IO.ANSI.green() <>
        "DONE writing .gitignore rules to output: #{output_path}" <> IO.ANSI.reset()
    )
  end
end
