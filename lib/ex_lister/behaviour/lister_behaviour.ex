defmodule ExLister.Behaviour.ListerBehaviour do
  @moduledoc """
  This behaviour defines a contract for converting values into lists.

  Modules implementing this behaviour must provide a `to_list/1` function
  that converts the given value into a list representation.

  ## Examples of implementing modules:
    * `ExLister.Behaviour.IntegerLister` - for integers
    * `ExLister.Behaviour.StringLister` - for strings
    * `ExLister.Behaviour.MapLister` - for maps
  """

  @doc """
  Converts the given value into a list representation.

  ## Parameters
    * `value` - The value to be converted

  ## Returns
    * A list representation of the input value
  """
  @callback to_list(term()) :: list()
end

defmodule ExLister.Behaviour.IntegerLister do
  @moduledoc """
  Converts integers into single-element lists.

  This module implements the `ExLister.Behaviour.ListerBehaviour` for integer values.

  ## Examples
      iex> ExLister.Behaviour.IntegerLister.to_list(42)
      [42]
  """
  @behaviour ExLister.Behaviour.ListerBehaviour

  @impl true
  @doc """
  Converts an integer into a single-element list.

  ## Parameters
    * `number` - The integer to convert

  ## Returns
    * A list containing the single integer

  ## Raises
    * `ArgumentError` - if the input is not an integer

  ## Examples
      iex> ExLister.Behaviour.IntegerLister.to_list(5)
      [5]
  """
  @spec to_list(integer()) :: [integer()]
  def to_list(number) when is_integer(number), do: [number]

  @spec to_list(term()) :: no_return()
  def to_list(_), do: raise(ArgumentError, "Expected integer value")
end

defmodule ExLister.Behaviour.StringLister do
  @moduledoc """
  Splits strings into lists of individual characters (graphemes).

  This module implements the `ExLister.Behaviour.ListerBehaviour` for string values.

  ## Examples
      iex> ExLister.Behaviour.StringLister.to_list("hello")
      ["h", "e", "l", "l", "o"]
  """
  @behaviour ExLister.Behaviour.ListerBehaviour

  @impl true
  @doc """
  Converts a string into a list of graphemes.

  ## Parameters
    * `string` - The string to convert

  ## Returns
    * A list of graphemes from the input string

  ## Raises
    * `ArgumentError` - if the input is not a string

  ## Examples
      iex> ExLister.Behaviour.StringLister.to_list("abc")
      ["a", "b", "c"]
  """
  @spec to_list(binary()) :: [binary()]
  def to_list(string) when is_binary(string), do: String.graphemes(string)

  @spec to_list(term()) :: no_return()
  def to_list(_), do: raise(ArgumentError, "Expected string value")
end

defmodule ExLister.Behaviour.MapLister do
  @moduledoc """
  Converts maps into lists of key-value tuples.

  This module implements the `ExLister.Behaviour.ListerBehaviour` for map values.

  ## Examples
      iex> ExLister.Behaviour.MapLister.to_list(%{a: 1, b: 2})
      [a: 1, b: 2]
  """
  @behaviour ExLister.Behaviour.ListerBehaviour

  @impl true
  @doc """
  Converts a map into a list of key-value tuples.

  ## Parameters
    * `map` - The map to convert

  ## Returns
    * A list of key-value tuples

  ## Raises
    * `ArgumentError` - if the input is not a map

  ## Examples
      iex> ExLister.Behaviour.MapLister.to_list(%{name: "John", age: 30})
      [name: "John", age: 30]
  """
  @spec to_list(map()) :: keyword()
  def to_list(map) when is_map(map), do: Map.to_list(map)

  @spec to_list(term()) :: no_return()
  def to_list(_), do: raise(ArgumentError, "Expected map value")
end
