defmodule ListFilterTest do
  use ExUnit.Case

  describe "call/1" do
    test "Should return the sum of all odd elements" do
      list = ["1", "3", "6", "43", "banana", "6", "abc"]

      response =
        list
        |> ListFilter.call()

      expected_response = 3

      assert response == expected_response
    end

    test "passing an empty list" do
      list = []
      assert ListFilter.call(list) == 0
    end
  end

  describe "convert_to_numbers/1" do
    test "When the list have numeric strings, return a list of integers" do
      list = ["1", "3", "6", "43", "banana", "6", "abc"]

      response =
        list
        |> ListFilter.convert_to_numbers()

      expected_response = [1, 3, 6, 43, nil, 6, nil]

      assert response == expected_response
    end

    test "When the list have numeric integers, return a list of integers" do
      list = [1, 3, 6, 43, "banana", 6, "abc"]

      response =
        list
        |> ListFilter.convert_to_numbers()

      expected_response = [1, 3, 6, 43, nil, 6, nil]

      assert response == expected_response
    end
  end

  describe "is_numeric/1" do
    test "When the element is an integer, return the integer" do
      element = 2
      response = ListFilter.is_numeric(element)
      expected_response = 2
      assert response == expected_response
    end

    test "When the element is an numeric string, return an integer" do
      element = "42"
      response = ListFilter.is_numeric(element)
      expected_response = 42
      assert response == expected_response
    end

    test "When the element is an string, return nil" do
      element = "asdf"
      response = ListFilter.is_numeric(element)
      expected_response = nil
      assert response == expected_response
    end
  end
end
