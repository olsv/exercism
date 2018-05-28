defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) when length(a) > length(b), do: compare(b, a, true)
  def compare(a, b), do: compare(a, b, false)

  defp compare(_, [], _), do: :unequal

  defp compare(a, b, inverse) do
    case {List.starts_with?(b, a), inverse} do
      {true, true} -> :superlist
      {true, false} -> :sublist
      _ -> compare(a, tl(b), inverse)
    end
  end
end
