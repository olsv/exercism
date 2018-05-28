defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    target_charlist = charlist(base)
    downcased_word = String.downcase(base)

    candidates
    |> Stream.filter(&(charlist(&1) == target_charlist))
    |> Stream.reject(&(String.downcase(&1) == downcased_word))
    |> Enum.into([])
  end

  defp charlist(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.sort()
  end
end
