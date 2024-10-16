defmodule Solution do
  
  def exec() do
    times = get()

    get()
    |> print_all(times)
  end

  def get() do
    IO.gets("")
    |> get()
  end

  def get(:eof), do: nil
  def get(string) do
    {integer, _} = Integer.parse(string)

    integer
  end

  def print_all(nil, _), do: nil
  def print_all(int, times) do
    print(int, times)

    get()
    |> print_all(times)
  end

  def print(_, 0), do: nil
  def print(int, times) do
    IO.puts(int)
    print(int, times-1)
  end
end

Solution.exec()
