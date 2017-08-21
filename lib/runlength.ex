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

  defp encode_chars(count, char, [another_char | more_chars]) do
    encode_chars(count, char, []) <> encode_chars(1, another_char, more_chars)
  end

  def decode(string) do
     case string |> split_in_chunks_of_two_bytes do
       [] -> ""
       runs -> runs |> Enum.map(&expand_run/1) |> Enum.reduce(&(&2 <> &1))
     end
     
  end

  defp expand_run(run) do
    [count, char] = run |> String.codepoints
    String.duplicate(char, String.to_integer(count))
  end

  defp split_in_chunks_of_two_bytes(string) do
    for <<x::binary-2 <- string>>, do: x
  end
end
