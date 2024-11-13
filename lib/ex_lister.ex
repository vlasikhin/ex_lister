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

  alias ExLister.Protocol.Lister

  alias ExLister.Behaviour.{
    IntegerLister,
    MapLister,
    StringLister
  }

  @type approach :: :protocol | :behaviour
  @type convertible_type :: integer() | binary() | map() | list() | tuple() | atom()

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
  @spec to_list(convertible_type(), approach()) :: list()
  def to_list(value, approach \\ :protocol)

  @spec to_list(convertible_type(), :protocol) :: list()
  def to_list(value, :protocol) do
    Lister.to_list(value)
  end

  @spec to_list(integer(), :behaviour) :: [integer()]
  def to_list(value, :behaviour) when is_integer(value) do
    IntegerLister.to_list(value)
  end

  @spec to_list(binary(), :behaviour) :: [binary()]
  def to_list(value, :behaviour) when is_binary(value) do
    StringLister.to_list(value)
  end

  @spec to_list(map(), :behaviour) :: keyword()
  def to_list(value, :behaviour) when is_map(value) do
    MapLister.to_list(value)
  end

  @spec to_list(term(), :behaviour) :: no_return()
  def to_list(_value, :behaviour) do
    raise ArgumentError, "Behaviour-based conversion not implemented for this type"
  end
end
