defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    bottles_of_beer = bottles_of_beer(number)
    bottles_rest = bottles_of_beer(number - 1)
    take_some_action = action(number)

    """
    #{ String.capitalize(bottles_of_beer) } on the wall, #{ bottles_of_beer }.
    #{ take_some_action }, #{ bottles_rest } on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 99..0) do
    Enum.map_join(range, "\n", &verse/1)
  end

  defp bottles_of_beer(number),
    do: "#{bottles(number)} #{bottle_or_bottles(number)} of beer"

  defp bottles(number) when number >= 1, do: number
  defp bottles(0), do: "no more"
  defp bottles(_), do: 99

  defp bottle_or_bottles(1), do: "bottle"
  defp bottle_or_bottles(_), do: "bottles"

  defp action(0), do: "Go to the store and buy some more"
  defp action(num), do: "Take #{ take_what(num) } down and pass it around"

  defp take_what(1), do: "it"
  defp take_what(_), do: "one"
end
