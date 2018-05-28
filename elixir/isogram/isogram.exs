defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    letters = Regex.scan(~r/\p{L}/, sentence)
    letters == Enum.uniq(letters)
  end
end
