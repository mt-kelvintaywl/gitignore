# GitIgnore

GitIgnore is a simple tool to auto-import the `.gitignore` files for various languages and/or frameworks from the popular Github collection at https://github.com/github/gitignore.

## TODO

> Add sample usage here
> BOTH (1) as a cli tool (via Docker) and (2) via Elixir code execution.

```sh
$ mix escript.build

# --output defaults to `.gitignore`
$ ./gitignore ruby python node --output .gitignore

Fetching .gitignore file for: ruby
Fetching .gitignore file for: python
Fetching .gitignore file for: node
DONE writing .gitignore rules to output: .gitignore
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gitignore` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gitignore, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/gitignore](https://hexdocs.pm/gitignore).

