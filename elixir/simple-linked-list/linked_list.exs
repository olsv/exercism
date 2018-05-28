defmodule LinkedList do
  @opaque t :: tuple()

  defguard is_empty(list) when tuple_size(list) == 0

  import Kernel, except: [length: 1]

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: {}

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem), do: {elem, list}

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list, acc \\ 0)
  def length(list, acc) when is_empty(list), do: acc
  def length(list, acc), do: length(elem(list, 1), acc + 1)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list), do: is_empty(list)

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) when is_empty(list), do: {:error, :empty_list}
  def peek(list), do: {:ok, elem(list, 0)}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list) when is_empty(list), do: {:error, :empty_list}
  def tail(list), do: {:ok, elem(list, 1)}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list) do
    with {:ok, head} <- peek(list), {:ok, tail} <- tail(list) do
      {:ok, head, tail}
    else
      error -> error
    end
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list, acc \\ new()) do
    case list do
      [] -> reverse(acc)
      _ -> from_list(tl(list), push(acc, hd(list)))
    end
  end


  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    case pop(list) do
      {:ok, head, tail} -> [head | to_list(tail)]
      _ -> []
    end
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list, acc \\ new()) do
    case pop(list) do
      {:ok, head, tail} -> reverse(tail, push(acc, head))
      _ -> acc
    end
  end
end
