defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp search(_, _, min, max) when max < min, do: :not_found

  defp search(numbers, key, min, max) do
    middle = div(min + max, 2)

    case elem(numbers, middle) do
      ^key -> {:ok, middle}
      value when key < value -> search(numbers, key, min, middle - 1)
      _ -> search(numbers, key, middle + 1, max)
    end
  end
end
