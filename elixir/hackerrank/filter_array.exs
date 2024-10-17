x = IO.gets("") |> String.trim("\n") |> String.to_integer()

IO.stream(:stdio, :line)
|> Enum.to_list()
|> Enum.map(&(&1 |> String.trim("\n") |> String.to_integer()))
|> Enum.filter(&(&1 < x))
|> Enum.each(&(IO.inspect(&1)))
