defmodule SRHub.UserController do
  use SRHub.Web, :controller

  alias SRHub.User

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
end
