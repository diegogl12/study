use Mix.Config

config :Github_Web_Hulk, :oauth_token, 
    token: System.get_env("OAUTH_TOKEN")