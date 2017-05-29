defmodule SRHub.UserControllerTest do
  use SRHub.ConnCase

  @valid %{username: "mobyman", email: "foo@bar.com", password: "mobydick"}
  @invalid %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource with valid data", %{conn: conn} do
    body = conn
      |> post(user_path(conn, :create), user: @valid)
      |> json_response(201)
    assert body["id"]
    assert body["email"]
    assert body["username"]
  end

  test "does not create when invalid", %{conn: conn} do
    resp = conn
      |> post(user_path(conn, :create), user: @invalid)
      |> json_response(422)
    assert resp["errors"] != %{}
  end

  test "can't create with duplicate name", %{conn: conn} do
    resp = conn
      |> post(user_path(conn, :create), user: @valid)
      |> post(user_path(conn, :create), user: @valid)
      |> json_response(422)
    assert resp["errors"] != %{}
    assert resp["errors"]["username"]
  end

  test "can't create with duplicate email", %{conn: conn} do
    resp = conn
      |> post(user_path(conn, :create), user: Map.put(@valid, :username, "ck"))
      |> post(user_path(conn, :create), user: @valid)
      |> json_response(422)
    assert resp["errors"] != %{}
    assert resp["errors"]["email"]
  end
end
