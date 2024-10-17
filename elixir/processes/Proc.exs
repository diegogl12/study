defmodule Proc do
  def lonely_loop (n\\0) do
    receive do
      
    end 
    IO.puts n
    lonely_loop n+1
  end
end
