defprotocol ExLister.Protocol.Lister do
  @moduledoc """
  Protocol for converting different common Elixir data types into lists.
  """

  @doc """
  Converts the input value into a list.

  ## Parameters
    * `input` - Value to be converted to a list
  """
  @spec to_list(term()) :: list()
  def to_list(input)
end

defimpl ExLister.Protocol.Lister, for: List do
  def to_list(list), do: list
end

defimpl ExLister.Protocol.Lister, for: Integer do
  def to_list(number), do: [number]
end

defimpl ExLister.Protocol.Lister, for: BitString do
  def to_list(string), do: String.graphemes(string)
end

defimpl ExLister.Protocol.Lister, for: Map do
  def to_list(map), do: Map.to_list(map)
end

defimpl ExLister.Protocol.Lister, for: Tuple do
  def to_list(tuple), do: Tuple.to_list(tuple)
end

defimpl ExLister.Protocol.Lister, for: Atom do
  def to_list(atom), do: [atom]
end
