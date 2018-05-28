defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    check_brackets(str, [])
  end

  defp check_brackets("", []),
    do: true
  defp check_brackets(<<h, rest::binary>>, acc) when h not in ~c({}[]\(\)),
    do: check_brackets(rest, acc)
  defp check_brackets(<<h, rest::binary>>, acc) when h in ~c({[\(),
    do: check_brackets(rest, [h | acc])
  defp check_brackets(<<?], rest::binary>>, [?[ | acc]),
    do: check_brackets(rest, acc)
  defp check_brackets(<<?}, rest::binary>>, [?{ | acc]),
    do: check_brackets(rest, acc)
  defp check_brackets(<<?), rest::binary>>, [?( | acc]),
    do: check_brackets(rest, acc)
  defp check_brackets(_, _),
    do: false
end
