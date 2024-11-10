defmodule ExListerTest do
  use ExUnit.Case
  doctest ExLister

  describe "to_list/1 with protocol" do
    test "converts various types to lists" do
      assert ExLister.to_list(5) == [5]
      assert ExLister.to_list("hello") == ["h", "e", "l", "l", "o"]
      assert ExLister.to_list(%{a: 1}) == [a: 1]
      assert ExLister.to_list({1, 2, 3}) == [1, 2, 3]
      assert ExLister.to_list(:atom) == [:atom]
    end
  end

  describe "to_list/2 with behaviour" do
    test "converts supported types to lists" do
      assert ExLister.to_list(5, :behaviour) == [5]
      assert ExLister.to_list("hello", :behaviour) == ["h", "e", "l", "l", "o"]
      assert ExLister.to_list(%{a: 1}, :behaviour) == [a: 1]
    end

    test "raises error for unsupported types" do
      assert_raise ArgumentError,
                   "Behaviour-based conversion not implemented for this type",
                   fn ->
                     ExLister.to_list({1, 2, 3}, :behaviour)
                   end
    end
  end

  test "defaults to protocol approach" do
    assert ExLister.to_list(5) == ExLister.to_list(5, :protocol)
  end
end
