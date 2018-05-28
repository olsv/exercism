defmodule TwelveDays do
  @days ["first", "second", "third", "fourth", "fifth", "sixth",
         "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

  @gifts ["a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens",
          "four Calling Birds", "five Gold Rings", "six Geese-a-Laying",
          "seven Swans-a-Swimming", "eight Maids-a-Milking",
          "nine Ladies Dancing", "ten Lords-a-Leaping", "eleven Pipers Piping",
          "twelve Drummers Drumming"]

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    day = day(number)
    gifts = gifts(number)

    "On the #{ day } day of Christmas my true love gave to me, #{ gifts }."
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.map(&verse(&1))
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing, do: verses(1, 12)

  defp day(number), do: Enum.at(@days, number - 1)

  defp gifts(number) do
    @gifts
    |> Enum.take(number)
    |> Enum.reverse()
    |> to_sentence()
  end

  defp to_sentence([only_one]), do: only_one
  defp to_sentence([first, second]), do: "#{ first }, and #{ second }"
  defp to_sentence([first | rest]), do: "#{ first }, #{ to_sentence(rest) }"
end
