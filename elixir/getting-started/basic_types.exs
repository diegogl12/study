IO.puts("===================================================================")
  IO.puts(":::BASICS:::")
  int = 1;
  IO.puts "This is an INTEGER #{int}"

  float = 6.9999999999999
  IO.puts "This is a FLOAT '#{float}'\nThat Rounded looks like this '#{round(float)}'\nAnd truncated looks like this '#{trunc(float)}'"

IO.puts("===================================================================")
  IO.puts(":::ATOMS:::")
#An atom is a constant whose name is its own value. Just like symbols in other languages

  IO.puts"An Atom looks like this ':Hi', wich it's value is #{:Hi}."

IO.puts("===================================================================")
#ANONYMOUS FUNCTION
#This is how we use anonymous function
  IO.puts(":::ANONYMOUS FUNCTION:::")
  add = fn a, b -> a+b end
  IO.puts("We are calling an anonymous function, and it's returning: #{add.(10,7)}")
 
IO.puts("===================================================================")
  IO.puts(":::LISTS:::")
#Lists are defined by '[]', and it can have any type inside
  list = [2,4,5,6,3]
  IO.puts "This is our list length #{length list}\nThis is our list plus [1,3]: #{tl(list ++ [1,3])}\nThis is our list minus [2,4]: #{list -- [2,4]}"

IO.puts("===================================================================")
IO.puts("===================================================================")
IO.puts("===================================================================")
IO.puts("===================================================================")
IO.puts("===================================================================")

