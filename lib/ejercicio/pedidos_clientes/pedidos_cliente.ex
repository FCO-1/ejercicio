defmodule Ejercicio.PedidosClientes.PedidosCliente do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pedidos_clientes" do
    field :status, :string
    belongs_to :pedido_id, Ejercicio.Pedidos.Pedido
    has_many :cliente_id, Ejercicio.Clientes.Cliente

    timestamps()
  end

  @doc false
  def changeset(pedidos_cliente, attrs) do
    pedidos_cliente
    |> cast(attrs, [:pedido_id, :cliente_id, :status])
    |> validate_required([:pedido_id, :cliente_id, :status])
    |> unique_constraint([:nombre])
  end
end
