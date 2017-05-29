defmodule SRHub.SessionTest do
  use SRHub.ModelCase
  alias SRHub.Session

  @valid %{user_id: "123"}
  @invalid %{}

  test "valid attributes" do
    changeset = Session.changeset(%Session{}, @valid)
    assert changeset.valid?
  end

  test "invalid attributes" do
    changeset = Session.changeset(%Session{}, @invalid)
    refute changeset.valid?
  end

  test "create with valid attributes; token exists" do
    changeset = Session.create_changeset(%Session{}, @valid)
    assert changeset.changes.token
    assert changeset.valid?
  end

  test "create with invalid" do
    changeset = Session.create_changeset(%Session{}, @invalid)
    refute changeset.valid?
  end
end
