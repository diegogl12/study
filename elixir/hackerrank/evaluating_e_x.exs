defmodule Solution do
  def exec(0.0), do: IO.inspect("")
  def exec(times) do
    get()
    |> function(9)
    |> Float.round(4)
    |> IO.inspect

    exec(times-1)
  end

  def get() do
    IO.gets("")
    |> Float.parse
    |> elem(0)
  end

  defp function(value, 1), do: value+1
  defp function(value, times) do
    power_value = power(value, times)
    factorial_value = factorial(times)
    (power_value/factorial_value) + function(value, times-1)
  end

  defp power(value, 1), do: value
  defp power(value, time), do: value*power(value, time-1)

  defp factorial(1), do: 1
  defp factorial(time), do: time*factorial(time-1)
end

