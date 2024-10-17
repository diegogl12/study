defmodule Github_Web_Hulk.Repositories do
    use Application

    def get_all(owner) do
        IO.inspect(Application.get_env(:Github_Web_Hulk, :oauth_token))
        HTTPoison.get("https://api.github.com/users/#{owner}/repos",%{"Authorization" => "token 57832d165bc579b697fe95befeadabb7ee66a004"}) |> IO.inspect
    end
end