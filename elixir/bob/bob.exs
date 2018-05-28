defmodule Bob do
  def hey(input) do
    cond do
      input =~ ~r/^\s{0,}$/
        -> "Fine. Be that way!"
      input =~ ~r/\?$/
        -> "Sure."
      input =~ ~r/\p{Lu}/u and input =~ ~r/^[\P{Ll}]+$/u
        -> "Whoa, chill out!"
      true
        -> "Whatever."
    end
  end
end
