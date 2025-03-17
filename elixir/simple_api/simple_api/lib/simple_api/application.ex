defmodule SimpleApi.Application do

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Endpoints, options: [port: port()]},
    ]

    opts = [strategy: :one_for_one, name: SimpleApi.Supervisor]

    Logger.info "The server has started at port #{port()}..."

    Supervisor.start_link(children, opts)
  end

  defp port, do: Application.get_env(:simple_api, :port, 8000)
end

