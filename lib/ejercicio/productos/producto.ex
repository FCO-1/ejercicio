defmodule Ejercicio.Productos.Producto do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "productos" do
    field :cantidad, :decimal
    field :descripcion, :string
    field :nombre, :string
    field :sku, :string
    field :total, :decimal
    belongs_to :categoria, Ejercicio.Productos.Categoria

    timestamps()
  end

  @doc false
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:nombre, :descripcion, :sku, :cantidad, :total])
    |> validate_required([:nombre, :descripcion, :sku, :cantidad, :total])
    |> unique_constraint([:sku])
  end
end
