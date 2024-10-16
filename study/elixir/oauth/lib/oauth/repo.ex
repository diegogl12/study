defmodule Oauth.Repo do
  use Ecto.Repo,
    otp_app: :oauth,
    adapter: Ecto.Adapters.Postgres
end
