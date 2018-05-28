defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    case list do
      [] -> []
      [nil | t] -> flatten(t)
      [h | t] when is_list(h) -> flatten(h) ++ flatten(t)
      [h | t] -> [h | flatten(t)]
    end
  end
end
