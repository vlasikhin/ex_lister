defmodule ExLister do
  @moduledoc """
  This module For converting various data types into lists.

  ## Examples using Protocol:
      iex> ExLister.to_list(5)
      [5]

      iex> ExLister.to_list("hello")
      ["h", "e", "l", "l", "o"]

  ## Examples using Behaviour:
      iex> ExLister.to_list(5, :behaviour)
      [5]

      iex> ExLister.to_list("hello", :behaviour)
      ["h", "e", "l", "l", "o"]
  """

  @doc """
  Converts a value to a list using protocol or behaviour.

  ## Parameters
    * `value` - The value to convert
    * `approach` - `:protocol` (default) or `:behaviour`

  ## Examples
      iex> ExLister.to_list(5)
      [5]

      iex> ExLister.to_list("hello", :behaviour)
      ["h", "e", "l", "l", "o"]
  """
  @spec to_list(term(), :protocol | :behaviour) :: list()
  def to_list(value, approach \\ :protocol)

  def to_list(value, :protocol) do
    ExLister.Protocol.Lister.to_list(value)
  end

  def to_list(value, :behaviour) when is_integer(value) do
    ExLister.Behaviour.IntegerLister.to_list(value)
  end

  def to_list(value, :behaviour) when is_binary(value) do
    ExLister.Behaviour.StringLister.to_list(value)
  end

  def to_list(value, :behaviour) when is_map(value) do
    ExLister.Behaviour.MapLister.to_list(value)
  end

  def to_list(_value, :behaviour) do
    raise ArgumentError, "Behaviour-based conversion not implemented for this type"
  end
end
