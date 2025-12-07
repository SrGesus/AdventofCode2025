defmodule Day07 do
  @type cell() :: :void | :beam | :splitter

  def to_cell(char) do
    case char do
      beam when beam in ["S", "|"] ->
        :beam

      "^" ->
        :splitter

      "." ->
        :void
    end
  end

  @spec solve(Enumerable.t(String.t()), :one | :two) :: integer()
  def solve(lines, part) do
    lines =
      lines
      |> Stream.map(fn number ->
        String.codepoints(number) |> Enum.map(&to_cell/1)
      end)
      |> Enum.to_list()

    case part do
      :one ->
        tl(lines)
        |> Enum.reduce({hd(lines), 0}, &split/2)
        |> elem(1)

      # |> Enum.filter(&(&1 == :beam))
      # |> Enum.count()

      :two ->
        lines |> Enum.reduce(List.duplicate(0, length(hd(lines))), &split2/2) |> Enum.sum()
    end
  end

  @spec split(list(cell()), list(cell())) :: list()
  def split(next, {prev, count}) do
    # Pad it
    pprev = [:void | prev ++ [:void]]
    pnext = [:void | next ++ [:void]]

    Enum.with_index(next)
    |> Enum.reduce({[], count}, fn {elem, i}, {list, c} ->
      i = i + 1

      {
        list ++
          [
            cond do
              elem == :splitter ->
                :splitter

              Enum.at(pprev, i - 1) == :beam and Enum.at(pnext, i - 1) == :splitter ->
                :beam

              Enum.at(pprev, i + 1) == :beam and Enum.at(pnext, i + 1) == :splitter ->
                :beam

              Enum.at(pprev, i) == :beam ->
                :beam

              true ->
                :void
            end
          ],
        c +
          if Enum.at(pprev, i) == :beam and elem == :splitter do
            # we be splitting
            1
          else
            0
          end
      }
    end)
  end

  @spec split2(list(cell()), list(cell())) :: list()
  def split2(next, prev) do
    pprev = [0 | prev ++ [0]]
    pnext = [:void | next ++ [:void]]

    for {this, i} <- Enum.with_index(next) do
      case this do
        :splitter ->
          0

        # Should only happen on first line
        :beam ->
          1

        :void ->
          center = Enum.at(pprev, i + 1)

          left =
            if Enum.at(pnext, i + 1 - 1) == :splitter do
              Enum.at(pprev, i + 1 - 1)
            else
              0
            end

          right =
            if Enum.at(pnext, i + 1 + 1) == :splitter do
              Enum.at(pprev, i + 1 + 1)
            else
              0
            end

          center + left + right
      end
    end
  end
end
