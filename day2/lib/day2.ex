defmodule Day2 do
  def start do
    {:ok, content} = File.read("priv/input")
    content
    |> String.split
    |> Enum.map(&String.graphemes/1)
    |> check_words
  end

  def check_words([h|t]) do
    case check_word(t, h) do
      {:mismatch, _} -> check_words(t)
      {:match, word} -> word |> Enum.join()
    end
  end

  def check_word([], _), do: {:mismatch, nil}
  def check_word([next|t], word) do
    case check_letter(next, word, false, []) do
      {:mismatch, _} -> check_word(t, word)
      {:match, result} -> {:match, result}
    end
  end
  def check_letter([a|b], [c|d], false, acc) when a == c do
    check_letter(b,d, false, acc ++ [a])
  end
  def check_letter([a|b], [c|d], true, acc) when a == c do
    check_letter(b,d, true, acc ++ [a])
  end
  def check_letter([a|b], [c|d], false, acc) when a != c do
    check_letter(b,d, true, acc)
  end
  def check_letter([a|b], [c|d], true, acc) when a != c do
    {:mismatch, nil}
  end
  def check_letter([],[], true, acc), do: {:match, acc}

end
