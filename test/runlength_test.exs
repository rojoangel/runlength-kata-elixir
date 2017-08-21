defmodule RunlengthTest do
  use ExUnit.Case
  doctest Runlength

  test "does nothing for empty string" do
    assert Runlength.encode("") == ""
  end
end
