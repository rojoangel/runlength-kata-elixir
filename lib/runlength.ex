defmodule Runlength do
  def encode(string) do
    case string |> String.codepoints do
      [] -> ""
      [char | more_chars] -> encode_chars(1, char, more_chars)
    end
  end

  defp encode_chars(count, char, []) do
    "#{count}#{char}"
  end

  defp encode_chars(count, char, [char | more_chars]) do
    encode_chars(count + 1, char, more_chars)
  end
end
