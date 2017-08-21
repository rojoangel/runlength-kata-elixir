defmodule Runlength do
  def encode(string) do
    case string |> String.codepoints do
      [] -> ""
      [char | []] -> "1#{char}"
      [char | [char | []]] -> "2#{char}"
    end
  end
end
