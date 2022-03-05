defmodule Ejercicio.Repo.Migrations.CreateCliente do
  use Ecto.Migration

  def change do
    create table(:cliente, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :apaterno, :string
      add :amaterno, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:cliente, [:email])
  end
end
