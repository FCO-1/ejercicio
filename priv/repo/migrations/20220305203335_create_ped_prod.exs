defmodule Ejercicio.Repo.Migrations.CreatePedProd do
  use Ecto.Migration

  def change do
    table = "ped_prod"
    create table(:ped_prod, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :producto_id, references(:productos, type: :binary_id, on_delete: :nothing), null: false
      add :pedido_id, references(:pedidos, type: :binary_id, on_delete: :nothing), null: false
      add :cantidad, :decimal
      add :total, :decimal

      timestamps()
    end

    execute("ALTER TABLE #{table} ALTER COLUMN id SET DEFAULT uuid_generate_v4();","")
    execute("ALTER TABLE #{table} ALTER COLUMN inserted_at SET DEFAULT now();","")
    execute("ALTER TABLE #{table} ALTER COLUMN updated_at SET DEFAULT now();","")
  end
end
