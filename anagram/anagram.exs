defmodule Anagram do
  def match(word, list) do
    Enum.filter list, fn(candidate) ->
      is_anagram?(word, candidate)
    end
  end

  defp is_anagram?("", ""), do: true

  defp is_anagram?("", word), do: false

  defp is_anagram?(word, candidate) do
    letter = String.first word

    if candidate |> String.contains? letter do
      is_anagram?(
        String.replace(word, letter, "", global: false),
        String.replace(candidate, letter, "", global: false)
        )
    end
  end
end
