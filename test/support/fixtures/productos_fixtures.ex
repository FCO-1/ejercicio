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

  @doc """
  Generate a producto.
  """
  def producto_fixture(attrs \\ %{}) do
    {:ok, producto} =
      attrs
      |> Enum.into(%{
        cantidad: "120.5",
        descripcion: "some descripcion",
        nombre: "some nombre",
        sku: "some sku",
        total: "120.5"
      })
      |> Ejercicio.Productos.create_producto()

    producto
  end
end
