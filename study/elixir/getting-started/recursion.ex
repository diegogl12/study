defmodule Rec do

  #last FUNCTION RETURNS THE LAST VALUE OF THE list PARAM

  def last(list) do
    if tl(list) == [], do: hd(list), else: list|>tl|>last
  end

  #pos FUNCTION RETURNS THE POSITION OF THE val PARAM PASSED.
  #IF THERE IS NO MATCH BETWEEN val PARAM AND A LIST VALUE, IT RETURNS false

  def pos(list,val) do
    do_pos(list,val,1)
  end

  defp do_pos(list,val,acc) when hd(list) == val, do: acc
  defp do_pos([_h | []],_val,_acc), do: false
  defp do_pos(list,val,acc), do: do_pos(tl(list),val,acc+1)
end
