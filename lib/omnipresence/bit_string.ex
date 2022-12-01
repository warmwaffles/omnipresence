defimpl Omnipresence, for: BitString do
  def present?(<<>>), do: false
  def present?(value), do: presence(value) != nil

  def blank?(value), do: !present?(value)

  def presence(<<>>), do: nil

  def presence(value) when is_binary(value) do
    case String.trim(value) do
      "" -> nil
      trimmed -> trimmed
    end
  end

  def presence(value), do: value
end
