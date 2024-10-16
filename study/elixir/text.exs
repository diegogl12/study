defmodule MP do
  import IO, only: [puts: 1]
  import Kernel, except: [inspect: 1]
  
  alias Sample.Enum.Test

  def say_here(text) do
    Test.first(text)
  end

  def inspect(param1) do
    puts "Starting Output"
    puts param1
    puts "Ending Output"
  end
end
