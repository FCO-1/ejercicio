defmodule Ejercicio.ClientesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ejercicio.Clientes` context.
  """

  @doc """
  Generate a unique cliente email.
  """
  def unique_cliente_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a cliente.
  """
  def cliente_fixture(attrs \\ %{}) do
    {:ok, cliente} =
      attrs
      |> Enum.into(%{
        amaterno: "some amaterno",
        apaterno: "some apaterno",
        email: unique_cliente_email(),
        nombre: "some nombre"
      })
      |> Ejercicio.Clientes.create_cliente()

    cliente
  end
end
