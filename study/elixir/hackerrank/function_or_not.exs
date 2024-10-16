defmodule Solution do
  def exec(0), do: ""
  def exec(times) do

    result = get()
    |> function?

    case result do
      {:true, _ } ->
        IO.inspect(YES)
      {:false, _ } ->
        IO.inspect(NO)
    end

    exec(times-1)
  end

  def function?(times, map \\ %{})
  def function?(0, map), do: {:true, map}
  def function?(times, map) do
    {x, y} = get()
    case function?(times-1, map) do
      {:true, map} ->
        validation(x, y, map)
      {:false, map} ->
        {:false, map}
    end
  end

  def get do
    case IO.gets("")
    |> Integer.parse do
    {int, "\n"} ->
        int
    {int, string} ->
        second_int = String.split(string, " ")
        |> Enum.at(1)
        |> Integer.parse
        |> elem(0)

        {int, second_int}
    end
  end

  defp validation(x, y, map) do
    case Map.fetch(map, x) do
      {:ok, y_value} ->
        if(y_value != y) do
          {:false, %{}}
        else
          {:true, map}
        end
      :error ->
        map = Map.put(map, x, y)
        {:true, map}
    end
  end
end

