defimpl Omnipresence, for: Atom do
  def present?(nil), do: false
  def present?(true), do: true
  def present?(false), do: false
  def present?(atom) when is_atom(atom), do: true

  def blank?(value), do: !present?(value)

  def presence(nil), do: nil
  def presence(true), do: true
  def presence(false), do: nil
  def presence(atom) when is_atom(atom), do: atom
end
