defmodule Endpoints do
  use Plug.Router

  plug :match
  plug Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Jason
  plug :dispatch

  get "/" do
    content = %{message: "All Good!!!"} |> Jason.encode!()
    send_resp(conn, 200, content)
  end

  match _ do
    send_resp(conn, 404, "Page not found")
  end
end
