defmodule SRHub.SessionController do
  use SRHub.Web, :controller
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  alias SRHub.User
  alias SRHub.Session

  def create(conn, %{"user" => user_params}) do
    user = Repo.get_by(User, username: user_params["username"])
    cond do
      user && checkpw(user_params["password"], user.password_hash) ->
        {:ok, session} =
          Session.create_changeset(%Session{}, %{user_id: user.id})
          |> Repo.insert
        conn
        |> put_status(:created)
        |> render("session.json", %{session: session, user: user})
      user ->
        conn
        |> put_status(:unauthorized)
        |> render("error.json", user_params)
      true ->
        dummy_checkpw()
        conn
        |> put_status(:unauthorized)
        |> render("error.json", user_params)
    end
  end
end
