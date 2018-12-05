defmodule Day2 do
  def start do
    {:ok, content} = File.read("priv/input.txt")
    content
    |> String.split
    |> Enum.map(&counter/1)
    |> IO.inspect
    |> Enum.reduce({0,0}, fn x, acc -> checksum(x, acc) end)
    |> (fn {x, y} -> x*y end).()
  end

  def checksum({true, true}, {a2, a3}), do: {a2+1, a3+1}
  def checksum({true, false}, {a2, a3}), do: {a2+1, a3}
  def checksum({false, true}, {a2, a3}), do: {a2, a3+1}
  def checksum({false, false}, {a2, a3}), do: {a2, a3}

  def counter(list) do
    list
    |> String.graphemes
    |> Enum.sort
    |> (&(counter(tl(&1), hd(&1), 1, %{two: 0,three: 0}))).()
  end
  def counter([], _, count, acc) do
    case count do
      2 -> {true, acc.three > 0}
      3 -> {acc.two > 0, true}
      _ -> {acc.two > 0, acc.three > 0}
    end
  end
  def counter([h|t], letter, count, acc) when h != letter do
    case count do
      2 -> counter(t, h, 1, %{acc | two: acc.two + 1})
      3 -> counter(t, h, 1, %{acc | three: acc.three + 1})
      _ -> counter(t, h, 1, acc)
    end
  end
  def counter([h|t], letter, count, acc) do
    counter(t, h, count + 1, acc)
  end
end
