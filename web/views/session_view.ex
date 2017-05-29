defmodule SRHub.SessionView do
  use SRHub.Web, :view

  def render("session.json", %{session: session}) do
    %{token: session.token}
  end

  def render("error.json", _whatever) do
    %{errors: "failed to authenticate"}
  end
end
