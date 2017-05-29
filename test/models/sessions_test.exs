defmodule SRHub.SessionsTest do
  use SRHub.ModelCase

  alias SRHub.Sessions

  @valid_attrs %{token: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sessions.changeset(%Sessions{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sessions.changeset(%Sessions{}, @invalid_attrs)
    refute changeset.valid?
  end
end
