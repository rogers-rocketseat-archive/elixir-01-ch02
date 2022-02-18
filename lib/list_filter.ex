defmodule ListFilter do
  require Integer

  def call(list) do
    list
    |> convert_to_numbers()
    |> Enum.filter(fn elem -> !is_nil(elem) end)
    |> Enum.filter(fn elem -> Integer.is_odd(elem) end)
    |> length()
  end

  def convert_to_numbers(alpha_numeric_list) do
    alpha_numeric_list
    |> Enum.map(fn num -> is_numeric(num) end)
  end

  def is_numeric(num) do
    case is_number(num) do
      true ->
        num

      false ->
        case Integer.parse(num) do
          {_, ""} -> String.to_integer(num)
          :error -> nil
        end
    end
  end
end
