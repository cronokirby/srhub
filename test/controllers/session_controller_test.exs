defmodule SRHub.SessionControllerTest do
  use SRHub.ConnCase
  alias SRHub.Session
  alias SRHub.User

  @valid %{email: "foo@bar.com", password: "mobydick", username: "ck"}

  setup %{conn: conn} do
    changeset = User.registration_changeset(%User{}, @valid)
    Repo.insert(changeset)
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: @valid
    resp = json_response(conn, 201)
    assert resp["token"]
    assert resp["user"]
    assert Repo.get_by(Session, token: resp["token"])
  end

  test "does not create resource when password is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create),
           user: Map.put(@valid, :password, "notright")
    assert json_response(conn, 401)["errors"] != %{}
  end

  test "does not create resource when username is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create),
           user: Map.put(@valid, :username, "kk")
    assert json_response(conn, 401)["errors"] != %{}
  end
end
