defmodule Ejercicio.Repo.Migrations.CreatePedidosClientes do
  use Ecto.Migration

  def change do
    table = "pedidos_clientes"
    create table(:pedidos_clientes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :status, :string
      add :pedido_id, references(:pedidos, type: :binary_id, on_delete: :delete_all), null: false
      add :cliente_id, references(:cliente, type: :binary_id, on_delete: :delete_all), null: false
      timestamps()
    end
    execute("ALTER TABLE #{table} ALTER COLUMN id SET DEFAULT uuid_generate_v4();","")
    execute("ALTER TABLE #{table} ALTER COLUMN inserted_at SET DEFAULT now();","")
    execute("ALTER TABLE #{table} ALTER COLUMN updated_at SET DEFAULT now();","")

    create unique_index(:pedidos_clientes, [:pedido_id, :cliente_id])
  end
end
