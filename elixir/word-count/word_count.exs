defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[^\p{L}\d\-]/u, trim: true)
    |> Enum.reduce(%{}, &update_count/2)
  end

  defp update_count(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end
end
