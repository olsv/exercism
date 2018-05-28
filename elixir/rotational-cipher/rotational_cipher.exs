defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_string for char <- to_charlist(text), do: replace(char, shift)
  end

  defp replace(char, shift) do
    cond do
      char in ?a..?z -> ?a + rem(char + shift - ?a, 26)
      char in ?A..?Z -> ?A + rem(char + shift - ?A, 26)
      true -> char
    end
  end
end
