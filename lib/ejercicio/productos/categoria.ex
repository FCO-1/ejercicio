defmodule Ejercicio.Productos.Categoria do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categorias" do
    field :descripcion, :string
    field :nombre, :string
    has_many :producto, Ejercicio.Productos.Producto
    timestamps()
  end

  @doc false
  def changeset(categoria, attrs) do
    categoria
    |> cast(attrs, [:nombre, :descripcion])
    |> validate_required([:nombre, :descripcion])
    |> unique_constraint([:nombre])
  end
end
