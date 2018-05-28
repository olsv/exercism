defmodule PigLatin do
  @vowels ~w(a e i o u yt xr)
  @consonant_clusters ~w(sch ch squ qu thr th)
  @regexp ~r/^[aeiou]|xr|yt/


  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&to_piglatin/1)
    |> Enum.join(" ")
  end

  def to_piglatin(<<h::binary-size(1), t::binary>>) do
    case h =~ @regexp do
      true -> h <> t <> "ay"
      false -> to_piglatin(t <> h)
    end
  end

  def process(s = [h | t]) do
    case s |> Enum.join("")  =~ @regexp do
      true -> [h] ++ t ++ ["ay"]
      false -> process(t ++ [h])
    end
  end

end
