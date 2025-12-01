defmodule Day01 do
  @modulo 100
  @first_value 50

  @type action :: {:L | :R, integer()}

  @spec add_rot(action(), integer()) :: integer()
  def add_rot({:L, n}, state), do: state - n
  def add_rot({:R, n}, state), do: state + n

  @spec solve(Enumerable.t(String.t()), :one | :two) :: integer()
  def solve(lines, part) do
    actions =
      lines
      |> Stream.map(&Regex.scan(~r/(L|R)([0-9]*)/, &1))
      |> Stream.map(fn [[_, rot, n]] ->
        {if(rot == "L", do: :L, else: :R), String.to_integer(n)}
      end)
      |> Enum.to_list()

    case part do
      :one ->
        actions
        |> Enum.reduce({@first_value, 0}, fn act, {s, i} ->
          new_state = add_rot(act, s) |> Integer.mod(@modulo)
          {new_state, i + if(new_state == 0, do: 1, else: 0)}
        end)

      :two ->
        actions
        |> Enum.reduce({@first_value, 0}, fn act, {s, i} ->
          rot = add_rot(act, s)

          {rot |> Integer.mod(@modulo),
           i +
             (AdventOfCode2025.el_range(s, rot)
              |> Enum.filter(&(Integer.mod(&1, @modulo) == 0))
              |> Enum.count())}
        end)
    end
    |> elem(1)
  end
end
