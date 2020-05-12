defmodule GitIgnore.Task do
  @moduledoc """
  Module responsible for assembling the fetched 
  `.gitignore` files over HTTP and writing to an output file path.
  """

  @doc """
  Takes requested languages and/or frameworks and outputs the collated `.gitignore` files to a designated file.
  Returns `:ok`.

  ## Examples

      iex> GitIgnore.Task.run(["ruby", "python"], "/path/to/project/.gitignore")
      :ok

  """
  def run(languages, output_path) do
    languages
    |> Enum.map(fn lang -> fetch(lang) end)
    |> output(output_path)
  end

  @doc """
  Fetches the `.gitignore` file content of a requested language or framework
  Returns `""` if not found.

  ## Examples

      iex> GitIgnore.Task.fetch("no such language or framework")
      ""

  """
  def fetch(language) do
    IO.puts("Fetching .gitignore file for: #{language}")
    content = GitIgnore.URL.fetch(language)

    if String.length(content) == 0, do: "", else: "\#\s#{language}\n\n#{content}"
  end

  defp output(contents, output_path) do
    File.write(output_path, Enum.join(["" | contents], "\n"), [:append])
  end
end
