defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(?A), do: "A\n"

  def build_shape(letter) do
    width = width(letter)
    Enum.to_list(?A..(letter - 1)) ++ [letter] ++ Enum.to_list((letter-1)..?A)
    |> Enum.map(&draw_letter(&1, width))
    |> Enum.join
  end



  def draw_letter(?A, width) do
    outer_spaces = div((width - 1), 2)
    spaces(outer_spaces) ++ [?A] ++ spaces(outer_spaces) ++ [?\n]
  end

  def draw_letter(letter, width) do
    innner_spaces = width(letter) - 2
    outer_spaces = width - width(letter)
    case outer_spaces do
      0 -> [letter] ++ spaces(innner_spaces) ++ [letter] ++ [?\n]
      _ ->
        half = div(outer_spaces, 2)
        spaces(half) ++ [letter] ++ spaces(innner_spaces) ++ [letter] ++ spaces(half) ++ [?\n]
    end
  end

  defp spaces(n), do: List.duplicate(?\s, n)
  defp width(letter), do: (letter - ?A) * 2 + 1
end


#  "    A    " => [4s] ++ [A] ++ [4s]
#  "   B B   " => [3s] ++ [B] ++ [1s] ++ [B] ++ [3s]
#  "  C   C  " => [2s] ++ [C] ++ [3s] ++ [C] ++ [2s]
#  " D     D " => [1s] ++ [D] ++ [5s] ++ [D] ++ [1s]
#  "E       E" => [E] ++ [7s] ++ [E]
#
# "     A     " => [5s] ++ [A] ++ [5s]
# "    B B    " => [4s] ++ [B] ++ [1s] ++ [B] ++ [4s]
# "   C   C   " => [3s] ++ [C] ++ [3s] ++ [C] ++ [3s]
# "  D     D  " => [2s] ++ [D] ++ [5s] ++ [D] ++ [2s]
# " E       E " => [1s] ++ [E] ++ [7s] ++ [E] ++ [1s]
# "F         F" => [F] ++ [9s] ++ [F]
#
#
#  "  A  " => [2s] ++ [A] ++ [2s]
#  " B B " => [1s] ++ [B] ++ [1s] ++ [B] ++ [1s]
#  "C   C" => [C] ++ [3s] ++ [C]
