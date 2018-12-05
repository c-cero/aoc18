defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "no letters" do
    assert Day2.counter("abcdef") == {false,false}
  end

  test "one double, one triple" do
    assert Day2.counter("bababc") == {true,true}
  end

  test "one double" do
    assert Day2.counter("abbcde") == {true,false}
  end

  test "one triple" do
    assert Day2.counter("abcccd") == {false,true}
  end
end
