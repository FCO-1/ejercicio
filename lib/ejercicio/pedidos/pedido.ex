defmodule Ejercicio.Pedidos.Pedido do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pedidos" do
    field :importe, :decimal
    field :serial, :string

    has_many :ped_prod, Ejercicio.Pedidos.PedProd

    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:serial, :importe])
    |> validate_required([:serial, :importe])
  end
end
