defmodule Github_Web_Hulk do

  def start do

    {:ok, response} = HTTPoison.get("https://api.github.com/users/diegogl12")

    Jason.decode!(response.body)
    |> IO.inspect

    # authentication(user_name, password)
    # |> IO.inspect
  end

  defp authentication(owner, password) do
    HTTPoison.get("https://api.github.com/users", %{"Authorization" => "token 57832d165bc579b697fe95befeadabb7ee66a004"})
  end

  defp get(message), do: IO.gets(message) |> String.replace("\n", "")
end
