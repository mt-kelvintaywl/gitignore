defmodule GitIgnore.URL do
  @moduledoc """
  Module responsible for the fetching of the GitHub
  `.gitignore` files over HTTP.
  """

  @base_url "https://raw.githubusercontent.com/github/gitignore/master/"

  @doc """
  Fetches the raw content (String) of the corresponding GitHub `.gitignore` file
  based on requested language or framework.
  """
  def fetch(language) do
    language
    |> path
    |> HTTPoison.get()
    |> body
  end

  @doc """
  Determines the absolute URL to fetch the `.gitignore` file over GitHub.
  """
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
      # e.g., 404
      _ -> ""
    end
  end

  defp body({:error, _}) do
    ""
  end
end
