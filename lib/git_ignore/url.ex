defmodule GitIgnore.URL do
  @base_url "https://raw.githubusercontent.com/github/gitignore/master/"

  def fetch(language) do
    language
    |> path
    |> HTTPoison.get()
    |> body
  end

  def path(language) do
    language
    |> String.capitalize()
    |> construct
  end

  defp construct(language) do
    @base_url <> "#{language}.gitignore"
  end

  defp body({:ok, response}) do
    case response.status_code() do
      200 -> response.body()
      _ -> ""
    end
  end

  defp body({:error, _}) do
    ""
  end
end
