defmodule GithubWebHulkTest do
  use ExUnit.Case
  doctest GithubWebHulk

  test "greets the world" do
    assert GithubWebHulk.hello() == :world
  end
end
