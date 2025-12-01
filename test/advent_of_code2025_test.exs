defmodule AdventOfCode2025Test do
  use ExUnit.Case
  doctest AdventOfCode2025

  test "greets the world" do
    assert AdventOfCode2025.hello() == :world
  end

  test "day_inputs lists files" do
    days = AdventOfCode2025.day_inputs(1)
    assert days == ["day01_0.txt", "day01_1.txt"]
  end

  test "input_lines enumerates file lines" do
    lines = AdventOfCode2025.input_lines("inputs/day01_0.txt") |> Enum.to_list()
    assert ["L68", "L30" | _] = lines
  end
end
