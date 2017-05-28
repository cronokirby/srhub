defmodule SRHub.User do
  use SRHub.Web, :model

  schema "users" do
    field :username, :string
    field :profile, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ["email", "profile", "username"])
    |> validate_required([:email, :username])
    |> validate_length(:email, min: 1, max: 255)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:username, min: 1, max: 30)
  end

  def registration_changeset(model, params \\ :empty) do
    model
    |> changeset(params)
    |> cast(params, ["password"])
    |> validate_length(:password, min: 6)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
