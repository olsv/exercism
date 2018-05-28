defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    distance(strand1, strand2, 0)
  end

  defp distance('', '', acc), do: {:ok, acc}
  defp distance([ah | at], [ah | bt], acc), do: distance(at, bt, acc)
  defp distance([_ | at], [_ | bt], acc), do: distance(at, bt, acc + 1)
  defp distance(_, _, _), do: {:error, "Lists must be the same length"}
end
