defmodule Day02Test do
  use ExUnit.Case

  test "day02 invalid" do
    assert Day02.next_dup(998) == 1010
    assert Day02.invalid_ids({998, 1012}) == [1010]
    assert Day02.invalid_ids({1_188_511_880, 1_188_511_890}) == [1_188_511_885]
    assert Day02.invalid_ids({222_220, 222_224}) == [222_222]
    assert Day02.invalid_ids({1_698_522, 1_698_528}) == []
    assert Day02.invalid_ids({446_443, 446_449}) == [446_446]
    assert Day02.invalid_ids({38_593_856, 38_593_862}) == [38_593_859]
    assert Day02.invalid_ids({565_653, 565_659}) == []
    assert Day02.invalid_ids({824_824_821, 824_824_827}) == []
    assert Day02.invalid_ids({2_121_212_118, 2_121_212_124}) == []

    assert Day02.invalid_ids2({11, 22}) == [11, 22]
    assert Day02.invalid_ids2({95, 115}) == [99, 111]
    assert Day02.invalid_ids2({998, 1012}) == [999, 1010]
    assert Day02.invalid_ids2({1_188_511_880, 1_188_511_890}) == [1_188_511_885]
    assert Day02.invalid_ids2({222_220, 222_224}) == [222_222]
    assert Day02.invalid_ids2({1_698_522, 1_698_528}) == []
    assert Day02.invalid_ids2({446_443, 446_449}) == [446_446]
    assert Day02.invalid_ids2({38_593_856, 38_593_862}) == [38_593_859]
    assert Day02.invalid_ids2({565_653, 565_659}) == [565_656]
    assert Day02.invalid_ids2({824_824_821, 824_824_827}) == [824_824_824]
    assert Day02.invalid_ids2({2_121_212_118, 2_121_212_124}) == [2_121_212_121]

    assert Day02.invalid_ids2({3_434_061_167, 3_434_167_492}) == [3_434_134_341]
    assert Day02.invalid_ids2({76_756_725, 76_781_020}) == [76_757_675, 76_767_676, 76_777_677]
    assert Day02.invalid_ids2({49, 147}) == [55, 66, 77, 88, 99, 111]
  end

  test "day02 example" do
    id = AdventOfCode2025.input_lines("inputs/day02_0.txt") |> Day02.solve(:one)
    assert id == 1_227_775_554
    id = AdventOfCode2025.input_lines("inputs/day02_0.txt") |> Day02.solve(:two)
    assert id == 4_174_379_265
  end

  test "day02 result" do
    id = AdventOfCode2025.input_lines("inputs/day02_1.txt") |> Day02.solve(:one)
    assert id == 19_219_508_902

    id = AdventOfCode2025.input_lines("inputs/day02_1.txt") |> Day02.solve(:two)
    assert id == 27_180_728_081

    lines = AdventOfCode2025.input_lines("inputs/day02_1.txt")
  end
end
