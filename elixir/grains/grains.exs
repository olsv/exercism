defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) when number < 1 or number > 64,
    do: { :error, "The requested square must be between 1 and 64 (inclusive)" }

  def square(number),
    do: {:ok, round(:math.pow(2, number - 1))}


  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total, do: {:ok, Enum.reduce(1..64, &sum/2)}

  defp sum(square_num, total) do
    {:ok, grains} = square(square_num)
    total + grains
  end
end
