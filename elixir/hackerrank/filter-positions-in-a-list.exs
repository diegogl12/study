count = -1 

IO.stream(:stdio, :line)
|> Enum.to_list()
|> Enum.map(&(&1 |> String.trim("\n") |> String.to_integer()))
|> Enum.each(&IO.puts/1)
|> Enum.with_index()
|> Enum.each(fn {pos, val} -> if rem(pos, 2) == 1, do: IO.puts(val)  end)

