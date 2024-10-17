defmodule Solution do
  def exec do
    times = get
    perimiter?(times)
    |> IO.inspect
  end

  def get do
    case IO.gets("") |> Integer.parse do
      {int, "\n"} ->
        int
      {int, string} ->
        second_int =  String.split(string, " ")
        |> Enum.at(1)
        |> Integer.parse
        |> elem(0)

        {int, second_int}
    end
  end

  defp perimiter?(0), do: 0
  defp perimiter?(times) do
    {x, y} = get()

    perimiter?(times-1) + abs(x - y)
  end
end
