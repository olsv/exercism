defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b) do
    cond do
      digits == [] or base_a < 2 or base_b < 2 -> nil
      base_a == base_b -> digits
      true -> digits |> from(base_a) |> into(base_b)
    end
  end

  def from(digits, base, acc \\ 0) do
    case digits do
      [] -> acc
      [h | t] when h >= 0 and h < base -> from(t, base, base * acc + h)
      _ -> nil
    end
  end


  # number -> 0..N
  def into(number, base, acc \\ []) do
    case number do
      nil -> nil
      0 -> acc
      _ -> into(div(number, base), base, [rem(number, base) | acc])
    end
  end
end
