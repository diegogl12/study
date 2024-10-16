defmodule OAuthTest do
  use ExUnit.Case
  doctest OAuth

  test "greets the world" do
    assert OAuth.hello() == :world
  end
end
