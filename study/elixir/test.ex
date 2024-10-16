defmodule Test do 
  def order_weight(string) do
    list = String.split(string) |> handle_list()
    Enum.sort_by(list,&(elem(&1,1)))
    |> Enum.map(&(elem(&1,0)))
    |> Enum.join(" ")
  end
  
  defp handle_list([hd | []]), do: [gen_tuple(hd)]
  defp handle_list([hd | tl]), do: [gen_tuple(hd)]++handle_list(tl)
  
  defp gen_tuple(value) do
    integer = parse_int(value)
    sum = sum_each_num(value)
    {integer, sum}
  end
  
  defp sum_each_num(""), do: 0
  defp sum_each_num(value) do
    {first,second} = String.split_at(value,1)
    
    parse_int(first)+sum_each_num(second)
  end
  
  defp parse_int(value), do: Integer.parse(value) |> elem(0) 
end
