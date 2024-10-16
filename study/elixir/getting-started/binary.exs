defmodule Bin do
  def to_binary(num) when num <= 1, do: to_string(num)
  def to_binary(num) when num > 1, do: to_binary(num/2) <> rem(num,2) |> to_string
end
