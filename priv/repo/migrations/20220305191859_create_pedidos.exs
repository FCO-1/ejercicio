defmodule Ejercicio.Repo.Migrations.CreatePedidos do
  use Ecto.Migration

  def change do
    table = "pedidos"
    create table(:pedidos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :serial, :string
      add :importe, :decimal

      timestamps()
    end

    execute("ALTER TABLE #{table} ALTER COLUMN id SET DEFAULT uuid_generate_v4();","")
    execute("ALTER TABLE #{table} ALTER COLUMN inserted_at SET DEFAULT now();","")
    execute("ALTER TABLE #{table} ALTER COLUMN updated_at SET DEFAULT now();","")


  end
end
