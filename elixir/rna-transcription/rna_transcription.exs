defmodule RNATranscription do
  @translation %{?A => ?U, ?C => ?G, ?T => ?A, ?G => ?C}
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    for nucleotide <- dna, do: @translation[nucleotide]
  end
end
