defimpl Omnipresence, for: List do
  def present?([]), do: false
  def present?(value) when is_list(value) and length(value) > 0, do: true

  def blank?(value), do: !present?(value)

  def presence([]), do: nil
  def presence(value), do: value
end
