defmodule OAuth.PageView do
    user OAuth, :view

    def render ("index.html", assigns) do
        "rendering with assigns #{inspect Map.keys(assigns)}"
    end
end