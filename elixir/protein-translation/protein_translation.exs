defmodule ProteinTranslation do
  @external_resource translations_path =
    Path.join([__DIR__, "protein_translations.txt"])

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    case of_rna(rna, []) do
      {:ok, proteins} -> {:ok, Enum.reverse(proteins)}
      _ -> {:error, "invalid RNA"}
    end
  end

  defp of_rna(<<codon::binary-size(3), rest::binary>>, proteins) do
    case of_codon(codon) do
      {:ok, "STOP"} -> {:ok, proteins}
      {:ok, protein} -> of_rna(rest, [protein | proteins])
      {:error, _} -> :error
    end
  end

  defp of_rna("", proteins), do: {:ok, proteins}
  defp of_rna(_strand, _proteins), do: :error


  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  for line <- File.stream!(translations_path, [], :line) do
    [codon, protein] =
      line
      |> String.split(~r/\s/, trim: true, parts: 2)
      |> Enum.map(&String.trim/1)

    def of_codon(unquote(codon)), do: {:ok, unquote(protein)}
  end

  def of_codon(_), do: {:error, "invalid codon"}
end
