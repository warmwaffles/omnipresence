defimpl Omnipresence, for: Tuple do
  def present?(value), do: tuple_size(value) > 0

  def blank?(value), do: !present?(value)

  def presence(value) when tuple_size(value) == 0, do: nil
  def presence(value), do: value
end
