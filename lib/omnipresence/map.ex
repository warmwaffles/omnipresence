defimpl Omnipresence, for: Map do
  def present?(map) when is_map(map) and map_size(map) == 0, do: false
  def present?(_), do: true

  def blank?(value), do: !present?(value)

  def presence(map) when is_map(map) and map_size(map) == 0, do: nil
  def presence(value), do: value
end
