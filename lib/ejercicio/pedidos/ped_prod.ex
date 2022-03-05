defmodule Ejercicio.Pedidos.PedProd do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "ped_prod" do
    field :cantidad, :decimal
    #field :pedido_id, Ecto.UUID
    #field :producto_id, Ecto.UUID
    field :total, :decimal

    belongs_to :pedido, Ejercicio.Pedidos.Pedido
    belongs_to :producto, Ejercicio.Productos.Producto


    timestamps()
  end

  @doc false
  def changeset(ped_prod, attrs) do
    ped_prod
    |> cast(attrs, [:producto_id, :pedido_id, :cantidad, :total])
    |> validate_required([:producto_id, :pedido_id, :cantidad, :total])
  end
end
