defprotocol ExLister.Protocol.Lister do
  @moduledoc """
  This protocol defines interface for converting a different data types into lists.

  It provides implementations for types:
  - List (returns the list as is)
  - Integer (converts to a single-element list)
  - BitString (converts string to list of graphemes)
  - Map (converts to list of key-value tuples)
  - Tuple (converts to list)
  - Atom (converts to single-element list)

  ## Examples
      iex> ExLister.Protocol.Lister.to_list(5)
      [5]

      iex> ExLister.Protocol.Lister.to_list("hello")
      ["h", "e", "l", "l", "o"]

      iex> ExLister.Protocol.Lister.to_list(%{a: 1, b: 2})
      [a: 1, b: 2]
  """

  @doc """
  Converts the input value into a list.

  ## Parameters
    * `input` - Value to be converted to a list

  ## Returns
    * A list representation of the input value
  """
  @spec to_list(term()) :: list()
  def to_list(input)
end

defimpl ExLister.Protocol.Lister, for: List do
  @doc """
  Implementation for List - returns the list unchanged.

  ## Examples
      iex> ExLister.Protocol.Lister.to_list([1, 2, 3])
      [1, 2, 3]
  """
  @spec to_list(list()) :: list()
  def to_list(list), do: list
end

defimpl ExLister.Protocol.Lister, for: Integer do
  @doc """
  Implementation for Integer - converts to single-element list.

  ## Examples
      iex> ExLister.Protocol.Lister.to_list(42)
      [42]
  """
  @spec to_list(integer()) :: [integer()]
  def to_list(number), do: [number]
end

defimpl ExLister.Protocol.Lister, for: BitString do
  @doc """
  Implementation for BitString - converts string to list of graphemes.

  ## Examples
      iex> ExLister.Protocol.Lister.to_list("hello")
      ["h", "e", "l", "l", "o"]
  """
  @spec to_list(binary()) :: [binary()]
  def to_list(string), do: String.graphemes(string)
end

defimpl ExLister.Protocol.Lister, for: Map do
  @doc """
  Implementation for Map - converts to list of key-value tuples.

  ## Examples
      iex> ExLister.Protocol.Lister.to_list(%{a: 1, b: 2})
      [a: 1, b: 2]
  """
  @spec to_list(map()) :: keyword()
  def to_list(map), do: Map.to_list(map)
end

defimpl ExLister.Protocol.Lister, for: Tuple do
  @doc """
  Implementation for Tuple - converts to list.

  ## Examples
      iex> ExLister.Protocol.Lister.to_list({1, 2, 3})
      [1, 2, 3]
  """
  @spec to_list(tuple()) :: list()
  def to_list(tuple), do: Tuple.to_list(tuple)
end

defimpl ExLister.Protocol.Lister, for: Atom do
  @doc """
  Implementation for Atom - converts to single-element list.

  ## Examples
      iex> ExLister.Protocol.Lister.to_list(:hello)
      [:hello]
  """
  @spec to_list(atom()) :: [atom()]
  def to_list(atom), do: [atom]
end
