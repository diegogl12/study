defmodule Payment.PaymentGenerator do
  def generate() do
    quantity = Enum.random(1..100) 

    Enum.map(1..quantity, &(%{id: &1, price: &1*Enum.random(1..10)}))
  end
end

