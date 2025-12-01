defmodule Day01Test do
  use ExUnit.Case

  test "day01 part1 example" do
    rotations = AdventOfCode2025.input_lines("inputs/day01_0.txt") |> Day01.solve(:one)
    assert rotations == 3
    rotations = AdventOfCode2025.input_lines("inputs/day01_0.txt") |> Day01.solve(:two)
    assert rotations == 6
  end

  test "day01 test" do
    rotations = AdventOfCode2025.input_lines("inputs/day01_1.txt") |> Day01.solve(:one)
    assert rotations == 964
    rotations = AdventOfCode2025.input_lines("inputs/day01_1.txt") |> Day01.solve(:two)
    assert rotations == 5872
  end
end
