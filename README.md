# Omnipresence

Yet another presence checker for elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `omnipresence` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:omnipresence, "~> 1.0"}
  ]
end
```

## Usage

```elixir
import Omnipresence

if present?(calculated_value()) do
  IO.puts("I'm present")
else
  IO.puts("I'm blank")
end

if blank?(nil) do
  IO.puts("I'm blank")
end
```

```elixir
raw_value
|> some_function()
|> Stream.map(&Omnipresence.presence/1)
|> Stream.reject(&is_nil/1)
|> Enum.each(fn value ->
  IO.inspect(value)
end)
```

## Imlementing Your Own

```elixir
defmodule Dog do
  defstruct [:name, :age]
end

defimpl Omnipresence, for: Dog do
  def present?(%Dog{name: nil, age: nil}), do: false
  def present?(_), do: true

  def blank?(dog), do: !present?(dog)

  def presence(%Dog{name: nil, age: nil}), do: nil
  def presence(dog), do: dog
end
```

```elixir
Omnipresence.present?(%Dog{name: "Frank", age: 2}) #=> true
Omnipresence.present?(%Dog{name: nil, age: nil})   #=> false

Omnipresence.blank?(%Dog{name: "Frank", age: 2})   #=> false
Omnipresence.blank?(%Dog{name: nil, age: nil})     #=> true

Omnipresence.presence(%Dog{name: "Frank", age: 2}) #=> %Dog{name: "Frank", age: 2}
Omnipresence.presence(%Dog{name: nil, age: nil})   #=> nil
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/omnipresence>.
