defmodule Ejercicio.PedidosClientesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ejercicio.PedidosClientes` context.
  """

  @doc """
  Generate a pedidos_cliente.
  """
  def pedidos_cliente_fixture(attrs \\ %{}) do
    {:ok, pedidos_cliente} =
      attrs
      |> Enum.into(%{
        cliente_id: "7488a646-e31f-11e4-aace-600308960662",
        pedido_id: "7488a646-e31f-11e4-aace-600308960662",
        status: "some status"
      })
      |> Ejercicio.PedidosClientes.create_pedidos_cliente()

    pedidos_cliente
  end
end
