defimpl Omnipresence, for: Float do
  def present?(_), do: true

  def blank?(_), do: false

  def presence(value), do: value
end
