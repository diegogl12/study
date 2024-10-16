defmodule Sample.Enum.Test do
  def first(list) do
    hd(list)
  end
  def second(test \\ 100), do: test;
end

