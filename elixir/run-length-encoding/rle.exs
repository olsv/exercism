defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.to_charlist()
    |> Enum.reverse()
    |> encode("", 1)
    |> to_string()
  end

  defp encode(<<head, rest::binary>>, <<last, _::binary>> = acc, cnt)
    when head == last, do: encode(rest, acc, cnt + 1)
  defp encode(string, acc, cnt)
    when cnt > 1, do: encode(string, acc <> to_string(cnt), 0)
  defp encode(<<head, rest::binary>>, acc, _cnt),
    do: encode(rest, acc <> head, 1)
  defp encode("", acc, _), do: Enum.reverse(acc)

  # defp encode([h | t], [ah | _] = acc,  cnt) when h == ah,
  #   do: encode(t, acc, cnt + 1)
  # defp encode(list, acc, cnt) when cnt > 1,
  #   do: encode(list, int_to_chars(cnt) ++ acc, 1)
  # defp encode([h | t], acc, _),
  #   do: encode(t, [h | acc], 1)
  # defp encode([], acc, _),
  #   do: acc

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.to_charlist()
    |> Enum.reverse()
    |> decode([], [])
    |> to_string()
  end


  defp decode([h | t], acc, cnt) when h in ?0..?9,
    do: decode(t, acc, [h | cnt])
  defp decode(list, [ah | _] = acc, cnt) when length(cnt) > 0,
    do: decode(list, clone(ah, List.to_integer(cnt) - 1) ++ acc, [])
  defp decode([h | t], acc, _),
    do: decode(t, [h | acc], [])
  defp decode([], acc, _),
    do: acc


  defp clone(char, times), do: for _ <- 1..times, do: char

  defp int_to_chars(int), do: int_to_chars(int, [])

  defp int_to_chars(int, acc) do
    if div(int, 10) > 0 do
      int_to_chars(div(int, 10), [?0 + rem(int, 10) | acc])
    else
      [?0 + int | acc]
    end
  end
end
