defmodule RunlengthTest do
  use ExUnit.Case
  doctest Runlength

  test "does nothing for empty string" do
    assert Runlength.encode("") == ""
  end

  test "encodes a run of length one" do
    assert Runlength.encode("J") == "1J"
  end

  test "encodes runs of sequential characters with a single instance of that value preceded by the number of items in the run" do
    assert Runlength.encode("JJ") == "2J"
    assert Runlength.encode("JJJJJJJJJ") == "9J"
  end

  test "encodes runs of different characters" do
    assert Runlength.encode("JJMMM") == "2J3M"
  end
end
