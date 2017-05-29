defmodule SRHub.SessionView do
  use SRHub.Web, :view

  def render("session.json", %{session: session, user: user}) do
    %{token: session.token, user: render_one(user, SRHub.UserView, "show.json")}
  end

  def render("error.json", _whatever) do
    %{errors: "failed to authenticate"}
  end
end
