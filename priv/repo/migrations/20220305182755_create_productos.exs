defmodule Ejercicio.Repo.Migrations.CreateProductos do
  use Ecto.Migration

  def change do
    table = "productos"

    create table(:productos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :descripcion, :string
      add :sku, :string
      add :cantidad, :decimal
      add :total, :decimal
      add :categoria_id, references(:categorias, type: :binary_id, on_delete: :nothing), null: false


      timestamps()
    end
    execute("ALTER TABLE #{table} ALTER COLUMN id SET DEFAULT uuid_generate_v4();","")
    execute("ALTER TABLE #{table} ALTER COLUMN inserted_at SET DEFAULT now();","")
    execute("ALTER TABLE #{table} ALTER COLUMN updated_at SET DEFAULT now();","")

    create unique_index(table, [:sku])

  end
end
