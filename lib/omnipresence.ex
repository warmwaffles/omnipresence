defprotocol Omnipresence do
  @moduledoc """
  A protocol for presence checking. This is intended to be imported when
  necessary.

  ## Implementing

  If you have a struct that you wish to have custom presence check for, you can
  implement it rather quickly.

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

  ## Examples

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

  ```elixir
  assert presence(" ") == nil
  ```
  """

  @fallback_to_any true

  @doc """
  Check if a value is present
  """
  @spec present?(term()) :: boolean()
  def present?(value)

  @spec blank?(term()) :: boolean()
  def blank?(value)

  @spec presence(term()) :: term() | nil
  def presence(value)
end
