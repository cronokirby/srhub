defmodule SRHub.UserController do
  use SRHub.Web, :controller

  alias SRHub.User
  alias SRHub.Session

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SRHub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def signup(conn, %{"user" => params}) do
    changeset = User.registration_changeset(%User{}, params)
    with {:ok, user} <- Repo.insert(changeset) do
      {:ok, session} =
        Session.create_changeset(%Session{}, %{user_id: user.id})
        |> Repo.insert
      conn
      |> put_status(:created)
      |> render(SRHub.SessionView, "session.json",
                %{session: session, user: user})
    else
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SRHub.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
