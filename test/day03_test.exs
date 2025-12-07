defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "day03 test" do
    number = "234234234234278" |> String.codepoints() |> Enum.map(&String.to_integer/1)
    assert Day03.get_joltage(number) |> Day03.list_to_number() == 434_234_234_278
  end

  test "day03 example" do
    id = AdventOfCode2025.input_lines("inputs/day03_0.txt") |> Day03.solve(:one)
    assert id == 357
    id = AdventOfCode2025.input_lines("inputs/day03_0.txt") |> Day03.solve(:two)
    assert id == 3_121_910_778_619
  end

  test "day03 result" do
    id = AdventOfCode2025.input_lines("inputs/day03_1.txt") |> Day03.solve(:one)
    assert id == 17263
    id = AdventOfCode2025.input_lines("inputs/day03_1.txt") |> Day03.solve(:two)
    assert id == 170731717900423
  end
end
