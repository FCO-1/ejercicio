defmodule Ejercicio.ProductosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ejercicio.Productos` context.
  """

  @doc """
  Generate a categoria.
  """
  def categoria_fixture(attrs \\ %{}) do
    {:ok, categoria} =
      attrs
      |> Enum.into(%{
        descripcion: "some descripcion",
        nombre: "some nombre"
      })
      |> Ejercicio.Productos.create_categoria()

    categoria
  end
end
