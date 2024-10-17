defmodule Solution do

  @print "Hello World"

  def exec(0), do: nil
  def exec(n) do
    
    exec(n-1)

   IO.puts(@print) 
  end
end

{n, _} = IO.gets("")
|> Integer.parse

Solution.exec(n)
