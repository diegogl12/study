defmodule Logged.RegistryTest do
  use ExUnit.Case, async: true

  alias Logged.Registry

  setup do
    pid = start_supervised!(Registry)

    %{pid: pid}
  end

  test "Should return offline if the id is not in the genserv" do
    assert {12, :offline} = Registry.is_logged?(12)
  end

  test "Should return online if the id is logged" do
    assert {12, :offline} = Registry.is_logged?(12)
    Registry.login(12)
    assert {12, :online} = Registry.is_logged?(12)
  end

  test "Should logoff a user", %{pid: pid} do
    Registry.login(12)
    assert {12, :online} = Registry.is_logged?(12)
    
    :erlang.trace(pid, true, [:receive])

    send(Registry, {:logout, 12})

    assert_receive {:trace, ^pid, :receive, {:logout, 12}}, 1000
    
    assert {12, :offline} = Registry.is_logged?(12) 
  end
end
