defmodule GithubWebHulk.Repositories do
  use Application

  alias GithubWebHulk.Structs.{Repository, User}

  def get_all() do
    url = Application.get_env(:github_web_hulk, :github_base_url)[:url]
    access_token = Application.get_env(:github_web_hulk, :oauth_token)[:token]
    owner = Application.get_env(:github_web_hulk, :owner)[:name]

    header = %{"Authorization" => "toke #{access_token}"}

    case HTTPoison.get("#{url}/users/#{owner}/repos", header) do
      {:ok, response} ->
        response
        |> Map.fetch!(:body)
        |> Jason.decode!()
        |> Repository.format()

      {:error, result} ->
        result
    end
  end

  def get(repo) do
    url = Application.get_env(:github_web_hulk, :github_base_url)[:url]
    access_token = Application.get_env(:github_web_hulk, :oauth_token)[:token]
    owner = Application.get_env(:github_web_hulk, :owner)[:name]

    header = %{"Authorization" => "toke #{access_token}"}

    case HTTPoison.get("#{url}/repos/#{owner}/#{repo}", header) do
      {:ok, response} ->
        response
        |> Map.fetch!(:body)
        |> Jason.decode!()
        |> Repository.format()

      {:error, result} ->
        result
    end
  end
end
