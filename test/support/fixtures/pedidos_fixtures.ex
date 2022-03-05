defmodule Ejercicio.PedidosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ejercicio.Pedidos` context.
  """

  @doc """
  Generate a pedido.
  """
  def pedido_fixture(attrs \\ %{}) do
    {:ok, pedido} =
      attrs
      |> Enum.into(%{
        importe: "120.5",
        serial: "some serial"
      })
      |> Ejercicio.Pedidos.create_pedido()

    pedido
  end

  @doc """
  Generate a ped_prod.
  """
  def ped_prod_fixture(attrs \\ %{}) do
    {:ok, ped_prod} =
      attrs
      |> Enum.into(%{
        cantidad: "120.5",
        pedido_id: "7488a646-e31f-11e4-aace-600308960662",
        producto_id: "7488a646-e31f-11e4-aace-600308960662",
        total: "120.5"
      })
      |> Ejercicio.Pedidos.create_ped_prod()

    ped_prod
  end
end
