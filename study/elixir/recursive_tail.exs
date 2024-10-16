defmodule Test do
  def rec_len([]), do: 0
  def rec_len(list), do: rec_len(list, 1)
  def rec_len([ _ | []], len), do: len
  def rec_len([ _ | tail], len), do: rec_len(tail, len+1)
end
