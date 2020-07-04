defmodule FeenixIntroWeb.PageController do
  use FeenixIntroWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
