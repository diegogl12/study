defmodule KV.Application do
  use Application

  def start(_type, _args) do
    children = [
      KV.Repo,
      KV.EventStore
    ]

    opts = [strategy: :one_for_one, name: KV.Application]
    Supervisor.start_link(children, opts)
  end
end
