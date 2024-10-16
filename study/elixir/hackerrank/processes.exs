defmodule Proc do
  def sp do
    parent = self()
    spawn fn -> send(parent, {:hello, self()}) end
  end

  def exec do
    receive do
      {:hello, pid} -> "Got hello from #{inpect(pid)}"
    end
  end
end
