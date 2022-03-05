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
end
