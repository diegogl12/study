defmodule GithubWebHulk.Structs.Repository do
  defstruct id: "", name: "", user_id: "", clone_url: "", ssh_url: ""

  def format(repos) when is_list(repos), do: Enum.map(repos, fn r -> format(r) end)

  def format(
        %{
          "id" => id,
          "name" => name,
          "owner" => owner,
          "clone_url" => clone_url,
          "ssh_url" => ssh_url
        } = repo
      )
      when is_map(repo) do
    %GithubWebHulk.Structs.Repository{
      id: id,
      name: name,
      user_id: owner |> Map.fetch!("id"),
      clone_url: clone_url,
      ssh_url: ssh_url
    }
  end

  def format(repo), do: IO.inspect(repo)
end
