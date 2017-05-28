defmodule SRHub.UserTest do
  use SRHub.ModelCase
  alias SRHub.User

  @valid %{email: "foo@bar.com", password: "mobydick",
           username: "mobyman", profile: "http://imgur.com/HCl0urO"}

  test "valid attributes" do
    changeset = User.changeset(%User{}, @valid)
    assert changeset.valid?
  end

  test "missing email fails" do
    changeset = User.changeset(%User{}, Map.put(@valid, :email, ""))
    refute changeset.valid?
  end

  test "invalid email format" do
    changeset = User.changeset(%User{}, Map.put(@valid, :email, "foo.com"))
    refute changeset.valid?
  end

  test "username too long" do
    too_long = Enum.join(1..31)
    changeset = User.changeset(%User{}, Map.put(@valid, :username, too_long))
    refute changeset.valid?
  end

  test "registration, valid attrs" do
    changeset = User.registration_changeset(%User{}, @valid)
    assert changeset.changes.password_hash
    assert changeset.valid?
  end

  test "registration, password too short" do
    changeset = User.registration_changeset(
      %User{}, Map.put(@valid, :password, "12345")
    )
  end
end
