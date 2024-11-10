defmodule ExLister.Behaviour.ListerBehaviour do
  @moduledoc """
  This behaviour requires implementing a single function:
  - `to_list/1`: converts the given value into a list
  """

  @doc """
  ## Parameters
    * `value` - The value to be converted
  """
  @callback to_list(term()) :: list()
end

defmodule ExLister.Behaviour.IntegerLister do
  @moduledoc """
  Converts integers into single-element lists.
  """
  @behaviour ExLister.Behaviour.ListerBehaviour

  @impl true
  def to_list(number) when is_integer(number), do: [number]
  def to_list(_), do: raise(ArgumentError, "Expected integer value")
end

defmodule ExLister.Behaviour.StringLister do
  @moduledoc """
  Splits strings into lists of individual characters.
  """
  @behaviour ExLister.Behaviour.ListerBehaviour

  @impl true

  def to_list(string) when is_binary(string), do: String.graphemes(string)
  def to_list(_), do: raise(ArgumentError, "Expected string value")
end

defmodule ExLister.Behaviour.MapLister do
  @moduledoc """
  Converts maps into lists of key-value tuples.
  """
  @behaviour ExLister.Behaviour.ListerBehaviour

  @impl true
  def to_list(map) when is_map(map), do: Map.to_list(map)
  def to_list(_), do: raise(ArgumentError, "Expected map value")
end
