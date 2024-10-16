defmodule Logged do
  def start(_type, args) do
    children = children(args)

    opts = [strategy: :one_for_one, name: Logged.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def children([:test]), do: []
  def children(_), do: [Logged.Registry]
end
