defmodule Hexadecimal do
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  @spec to_decimal(binary) :: integer
  def to_decimal(hex), do: to_decimal(hex, 0)

  defp to_decimal(hex, acc) do
    case hex do
      "" ->
        acc
      <<h, t::binary>> when h in ?0..?9 ->
        to_decimal(t, 16 * acc + (h - ?0))
      <<h, t::binary>> when h in ?a..?f ->
        to_decimal(t, 16 * acc + (h - ?a + 10))
      <<h, t::binary>> when h in ?A..?F ->
        to_decimal(t, 16 * acc + (h - ?A + 10))
      _ ->
        0
    end
  end
end

# 1 | 9ace => (0 * 16) + 1 => 1
# 9 | ace  => (1  * 16) + 9 => 25
# a | ce   => (25  * 16) + 10 => 410
# c | e    => (410  * 16) + 12 => 6572
# e | ""   => (6572  * 16) + 14 => 105_166

# 19ace => ((((((16 * 0) + 1) * 16 + 9) * 16 + 10) * 16 + 12) * 16 + 14)
