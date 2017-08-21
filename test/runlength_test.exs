defmodule RunlengthTest do
  use ExUnit.Case
  doctest Runlength

  test "does nothing for empty string" do
    assert Runlength.encode("") == ""
  end

  test "encodes a run of length one" do
    assert Runlength.encode("J") == "1J"
  end
end
