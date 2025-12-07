defmodule Day07Test do
  use ExUnit.Case
  doctest Day07

  test "day07 test" do
    assert Day07.split([:void, :splitter, :void], {[:void, :beam, :void], 0}) == {[:beam, :splitter, :beam] , 1}
    assert Day07.split([:void, :void, :void], {[:beam, :splitter, :beam], 0}) == {[:beam, :void, :beam], 0}
    assert Day07.split2([:void, :splitter, :void], [0, 1, 0]) == [1, 0, 1]
    assert Day07.split2([:void, :void, :void], [1, 0, 1]) == [1, 0, 1]
  end

  test "day07 example" do
    id = AdventOfCode2025.input_lines("inputs/day07_0.txt") |> Day07.solve(:one)
    assert id == 21
    id = AdventOfCode2025.input_lines("inputs/day07_0.txt") |> Day07.solve(:two)
    assert id == 40
  end

  test "day07 result" do
    id = AdventOfCode2025.input_lines("inputs/day07_1.txt") |> Day07.solve(:one)
    assert id == 1675
    id = AdventOfCode2025.input_lines("inputs/day07_1.txt") |> Day07.solve(:two)
    assert id == 187987920774390
  end
end
