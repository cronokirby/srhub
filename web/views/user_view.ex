defmodule SRHub.UserView do
  use SRHub.Web, :view

  def render("show.json", %{user: user}) do
    %{id: user.id, email: user.email,
      username: user.username, profile: user.profile}
  end
end
