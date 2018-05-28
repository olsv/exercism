defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) when limit < 2, do: []

  def primes_to(limit) do
    2..limit
    |> Enum.to_list()
    |> sieve()
  end

  defp sieve(list, acc \\ []) do
    case list do
      [] -> Enum.reverse(acc)
      [h | t] ->
        (for n <- t, rem(n, h) != 0, do: n)
        |> sieve([h | acc])
    end
  end
end
