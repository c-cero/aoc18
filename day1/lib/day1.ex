defmodule Day1 do

  def start() do
    frequency([], [0])
  end

  def frequency([], bases) do
    {:ok, content} = File.read("priv/input")
    content
    |> String.split("\r\n")
    |> Enum.map(&String.to_integer/1)
    |> frequency(bases)
  end

  def frequency([h|list], bases) do
    result = h+hd(bases)
    if Enum.member?(bases, result), do: result,
    else: frequency(list, [result|bases])
  end
end
