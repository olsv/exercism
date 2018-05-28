defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  for nucleotide <- @nucleotides do
    defp compute([head | tail], unquote(nucleotide), acc)
    when head == unquote(nucleotide) do
      compute(tail, unquote(nucleotide), acc + 1)
    end

    defp compute([_head | tail], unquote(nucleotide), acc) do
      compute(tail, unquote(nucleotide), acc)
    end
  end

  defp compute([], _nucleotide, acc) do
    acc
  end

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    compute(strand, nucleotide, 0)
  end

  # defp compute([head | tail], nucleotide, acc) when head == nucleotide do
  #   compute(tail, nucleotide, acc + 1)
  # end
  # defp compute([_head | tail], nucleotide, acc) do
  #   compute(tail, nucleotide, acc)
  # end
  # defp compute([], _nucleotide, acc), do: acc

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce @nucleotides, %{}, fn(nucleotide, acc) ->
      Map.merge(acc, %{nucleotide => count(strand, nucleotide)})
    end
  end
end
