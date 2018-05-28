defmodule Scrabble do
  @mapping %{
    1 => ~c(AEIOULNRSTaeioulnrst),
    2 => ~c(DGdg),
    3 => ~c(BCMPbcmp),
    4 => ~c(FHVWYfhvwy),
    5 => ~c(Kk),
    8 => ~c(JXjx),
    10 => ~c(QZqz)
  }
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    score(word, 0)
  end

  defp score("", acc), do: acc

  for {score, letters} <- @mapping do
    for letter <- letters do
      defp score(<<unquote(letter), rest::binary>>, acc),
        do: score(rest, unquote(score) + acc)
    end
  end

  defp score(<<_, rest::binary>>, acc), do: score(rest, acc)
end
