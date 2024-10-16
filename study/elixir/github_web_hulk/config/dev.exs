use Mix.Config

config :github_web_hulk, :oauth_token, token: System.get_env("OAUTH_TOKEN")

config :github_web_hulk, :github_base_url, url: System.get_env("GITHUB_BASE_URL")

config :github_web_hulk, :owner, name: System.get_env("OWNER_NAME")
