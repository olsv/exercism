defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(0, _), do: 0
  def to(limit, factors) do
    factors
    |> Enum.flat_map(&Enum.take_every(0..limit - 1, &1))
    |> Enum.uniq
    |> Enum.sum
  end
end
