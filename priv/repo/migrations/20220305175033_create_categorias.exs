defmodule Ejercicio.Repo.Migrations.CreateCategorias do
  use Ecto.Migration

  def change do

    table = "categorias"
    create table(:categorias, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :descripcion, :string
      timestamps()
    end

    execute("ALTER TABLE #{table} ALTER COLUMN id SET DEFAULT uuid_generate_v4();","")
    execute("ALTER TABLE #{table} ALTER COLUMN inserted_at SET DEFAULT now();","")
    execute("ALTER TABLE #{table} ALTER COLUMN updated_at SET DEFAULT now();","")

    create unique_index(:categorias, [:nombre])


  end
end
