defmodule Day03 do
  @spec solve(Enumerable.t(String.t()), :one | :two) :: integer()
  def solve(lines, part) do
    banks =
      lines
      |> Stream.map(fn number ->
        String.codepoints(number) |> Enum.map(&String.to_integer/1)
      end)
      |> Enum.to_list()

    case part do
      :one ->
        banks
        |> Enum.map(&get_joltage(&1, 2))
        |> Enum.map(&list_to_number/1)
        |> Enum.sum()

      :two ->
        banks
        |> Task.async_stream(&get_joltage/1, max_concurrency: System.schedulers_online())
        |> Enum.map(fn {:ok, l} -> list_to_number(l) end)
        |> Enum.sum()
    end
  end

  def get_joltage(values, number \\ 12, best \\ 0)
  def get_joltage(values, 1, _), do: [Enum.max(values)]

  def get_joltage([head | tail], number, best) do
    if length([head | tail]) < number do
      List.duplicate(0, number)
    else
      if head <= best do
        get_joltage(tail, number, best)
      else
        new_best = [head | get_joltage(tail, number - 1, 0)]
        mmax(new_best, get_joltage(tail, number, head))
      end
    end
  end

  @doc """
  A max for lists that will always discard lists that have non positive numbers in them

      iex> Day03.mmax([9, 9, 9, 0], [1, 1, 1, 1])
      [1, 1, 1, 1]
  """
  def mmax(a, b) do
    a_valid = Enum.all?(a, &(&1 > 0))
    b_valid = Enum.all?(b, &(&1 > 0))

    cond do
      a_valid && b_valid -> max(a, b)
      a_valid -> a
      b_valid -> b
      true -> b
    end
  end

  @doc """
  Transforms digit list into number

      iex> Day03.list_to_number([9, 9, 9, 0])
      9990
  """
  def list_to_number([v]), do: v
  def list_to_number([l, r]), do: l * 10 + r

  def list_to_number(l) do
    list_to_number(List.delete_at(l, -1)) * 10 + List.last(l)
  end
end
