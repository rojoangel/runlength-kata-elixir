defmodule Runlength do
  def encode(string) do
    case string |> String.codepoints do
      [] -> ""
      [char | []] -> "1#{char}" 
    end
  end
end
