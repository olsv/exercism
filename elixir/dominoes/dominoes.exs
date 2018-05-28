defmodule Dominoes do

  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain
  """
  @spec chain?(dominoes :: [domino] | []) :: boolean
  def chain?([]), do: true
  def chain?([h | t]), do: chain?(t, h)

  defp chain?([], {a , a}), do: true
  defp chain?([{a, _} = h | t], {_, a}), do: chain?(t, h)
  defp chain?(_, _), do: false
end
