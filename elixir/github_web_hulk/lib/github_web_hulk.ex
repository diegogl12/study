defmodule GithubWebHulk do

  def start(_type, _args) do
    owner = Application.get_env(:github_web_hulk, :owner)[:name]
    IO.puts("==========================================")
    IO.puts("Application started with owner '#{owner}'")
    IO.puts("==========================================")
    {:ok, self()}
  end
end
