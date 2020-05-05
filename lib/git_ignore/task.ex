defmodule GitIgnore.Task do
  def run(languages, output_path) do
    languages
    |> Enum.map(fn lang -> fetch(lang) end)
    |> output(output_path)
  end

  def fetch(language) do
    IO.puts("Fetching .gitinore file for: #{language}")
    content = GitIgnore.URL.fetch(language)

    if String.length(content) == 0, do: "", else: "\#\s#{language}\n\n#{content}"
  end

  defp output(contents, output_path) do
    File.write(output_path, Enum.join(["" | contents], "\n"), [:append])
  end
end
