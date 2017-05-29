defmodule SRHub.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, size: 30
      add :email, :string, null: false
      add :profile, :string
      add :password_hash, :string

      timestamps()
    end
    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end
