defmodule Ejercicio.Clientes.Cliente do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cliente" do
    field :amaterno, :string
    field :apaterno, :string
    field :email, :string
    field :nombre, :string

    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:nombre, :apaterno, :amaterno, :email])
    |> validate_required([:nombre, :apaterno, :amaterno, :email])
    |> unique_constraint(:email)
  end
end
