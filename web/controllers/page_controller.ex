defmodule SRHub.PageController do
  use SRHub.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
