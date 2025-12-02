defmodule Day02 do
  @type range :: {integer(), integer()}

  @spec solve(Enumerable.t(String.t()), :one | :two) :: integer()
  def solve(lines, part) do
    ranges =
      lines
      |> Stream.map(&Regex.scan(~r/([0-9]*)-([0-9]*)/, &1))
      |> Stream.map(fn [[_, l, r]] ->
        {String.to_integer(l), String.to_integer(r)}
      end)
      |> Enum.to_list()

    case part do
      :one ->
        ranges
        |> Enum.flat_map(&invalid_ids/1)
        |> Enum.sum()

      :two ->
        ranges
        |> Enum.flat_map(&invalid_ids2/1)
        |> Enum.sum()
    end
  end

  @spec _invalid_ids({integer(), integer()}, (integer() -> integer())) :: Enumerable.t(integer())
  def _invalid_ids({l, r}, next) do
    n = next.(l)

    if n <= r do
      [n | _invalid_ids({n + 1, r}, next)]
    else
      []
    end
  end

  @spec invalid_ids({integer(), integer()}) :: Enumerable.t(integer())
  def invalid_ids(range), do: _invalid_ids(range, &next_dup(&1))

  @spec invalid_ids2({integer(), integer()}) :: Enumerable.t(integer())
  def invalid_ids2(range), do: _invalid_ids(range, &next_dup(&1, false))

  def next_dup(current, only_twice \\ true) do
    str = Integer.to_string(current)
    len = String.length(str)
    half = max(div(len, 2), 1)
    # IO.puts("Trying #{current}")

    next =
      if(only_twice, do: ceil(len / 2)..half//1, else: 1..half)
      |> Enum.filter(&(Integer.mod(len, &1) == 0))
      |> Enum.map(fn i ->
        slice = str |> String.slice(0..(i - 1))
        new = dup(slice, div(len, i))
        # IO.puts("new: #{new} half: #{i}")

        if new >= current do
          new
        end
      end)
      |> Enum.min(&<=/2, fn -> nil end)

    slice = str |> String.slice(0..(half - 1 + Integer.mod(len, 2)))
    next_try = (String.to_integer(slice) + 1) * 10 ** half

    if next != nil and next < next_try do
      next
    else
      next_dup(next_try, only_twice)
    end
  end

  @spec dup(String.t()) :: integer()
  def dup(str), do: dup(str, 2)

  @spec dup(String.t(), integer()) :: integer()
  def dup(str, n), do: _dup(str, n) |> String.to_integer()

  @spec _dup(String.t(), integer()) :: String.t()
  def _dup(str, 2), do: str <> str
  # There are no 1 digit invalid ids, jump to 11
  def _dup(_str, 1), do: "11"
  def _dup(str, n), do: _dup(str, n - 1) <> str
end
