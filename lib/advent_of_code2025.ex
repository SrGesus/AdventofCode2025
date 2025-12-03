defmodule AdventOfCode2025 do
  @moduledoc """
  Documentation for `AdventOfCode2025`.
  """

  @spec hello() :: :world
  @doc """
  Hello world.

  ## Examples

      iex> AdventOfCode2025.hello()
      :world

  """
  def hello do
    :world
  end

  @spec input_lines(String.t()) :: Enumerable.t(String.t())
  def input_lines(path) do
    File.stream!(path) |> Stream.map(&String.trim_trailing/1)
  end

  @spec day_inputs(integer()) :: any()
  def day_inputs(day) do
    day_string = String.pad_leading(Integer.to_string(day), 2, "0")
    File.ls!("inputs") |> Enum.filter(&String.match?(&1, ~r/day#{day_string}.*.txt/))
  end

  @spec range(Range.limit(), Range.limit()) :: Range.t()
  @doc """
  Inclusive range that goes from `x` to `y`, adopting +1 or -1 step.

  ## Examples

      iex> AdventOfCode2025.range(1, 5)
      1..5

      iex> AdventOfCode2025.range(5, 1)
      5..1//-1

  """
  def range(x, y, n) when x <= y, do: x..y//n
  def range(x, y, n), do: x..y//-n
  def range(x, y), do: range(x, y, 1)

  @spec el_range(Range.limit(), Range.limit()) :: Range.t()
  @doc """
  Inclusive right, exclusive left range
  that goes from `x` to `y`, adopting +1 or -1 step.

  ## Examples

      iex> AdventOfCode2025.el_range(1, 5)
      2..5

      iex> AdventOfCode2025.el_range(5, 1)
      4..1//-1

      # Empty
      iex> AdventOfCode2025.el_range(5, 5)
      6..5//1

  """
  def el_range(x, y, n) when x <= y, do: (x + 1)..y//n
  def el_range(x, y, n), do: (x - 1)..y//-n
  def el_range(x, y), do: el_range(x, y, 1)

  def run_time(function) do
    function
    |> :timer.tc()
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end
