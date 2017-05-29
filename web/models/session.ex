defmodule SRHub.Session do
  use SRHub.Web, :model

  schema "sessions" do
    field :token, :string
    belongs_to :user, SRHub.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:user_id])
    |> validate_required([:user_id])
  end

  def create_changeset(model, params \\ %{}) do
    model
    |> changeset(params)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
