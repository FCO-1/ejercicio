defmodule Ejercicio.PedidosClientesTest do
  use Ejercicio.DataCase

  alias Ejercicio.PedidosClientes

  describe "pedidos_clientes" do
    alias Ejercicio.PedidosClientes.PedidosCliente

    import Ejercicio.PedidosClientesFixtures

    @invalid_attrs %{cliente_id: nil, pedido_id: nil, status: nil}

    test "list_pedidos_clientes/0 returns all pedidos_clientes" do
      pedidos_cliente = pedidos_cliente_fixture()
      assert PedidosClientes.list_pedidos_clientes() == [pedidos_cliente]
    end

    test "get_pedidos_cliente!/1 returns the pedidos_cliente with given id" do
      pedidos_cliente = pedidos_cliente_fixture()
      assert PedidosClientes.get_pedidos_cliente!(pedidos_cliente.id) == pedidos_cliente
    end

    test "create_pedidos_cliente/1 with valid data creates a pedidos_cliente" do
      valid_attrs = %{cliente_id: "7488a646-e31f-11e4-aace-600308960662", pedido_id: "7488a646-e31f-11e4-aace-600308960662", status: "some status"}

      assert {:ok, %PedidosCliente{} = pedidos_cliente} = PedidosClientes.create_pedidos_cliente(valid_attrs)
      assert pedidos_cliente.cliente_id == "7488a646-e31f-11e4-aace-600308960662"
      assert pedidos_cliente.pedido_id == "7488a646-e31f-11e4-aace-600308960662"
      assert pedidos_cliente.status == "some status"
    end

    test "create_pedidos_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PedidosClientes.create_pedidos_cliente(@invalid_attrs)
    end

    test "update_pedidos_cliente/2 with valid data updates the pedidos_cliente" do
      pedidos_cliente = pedidos_cliente_fixture()
      update_attrs = %{cliente_id: "7488a646-e31f-11e4-aace-600308960668", pedido_id: "7488a646-e31f-11e4-aace-600308960668", status: "some updated status"}

      assert {:ok, %PedidosCliente{} = pedidos_cliente} = PedidosClientes.update_pedidos_cliente(pedidos_cliente, update_attrs)
      assert pedidos_cliente.cliente_id == "7488a646-e31f-11e4-aace-600308960668"
      assert pedidos_cliente.pedido_id == "7488a646-e31f-11e4-aace-600308960668"
      assert pedidos_cliente.status == "some updated status"
    end

    test "update_pedidos_cliente/2 with invalid data returns error changeset" do
      pedidos_cliente = pedidos_cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = PedidosClientes.update_pedidos_cliente(pedidos_cliente, @invalid_attrs)
      assert pedidos_cliente == PedidosClientes.get_pedidos_cliente!(pedidos_cliente.id)
    end

    test "delete_pedidos_cliente/1 deletes the pedidos_cliente" do
      pedidos_cliente = pedidos_cliente_fixture()
      assert {:ok, %PedidosCliente{}} = PedidosClientes.delete_pedidos_cliente(pedidos_cliente)
      assert_raise Ecto.NoResultsError, fn -> PedidosClientes.get_pedidos_cliente!(pedidos_cliente.id) end
    end

    test "change_pedidos_cliente/1 returns a pedidos_cliente changeset" do
      pedidos_cliente = pedidos_cliente_fixture()
      assert %Ecto.Changeset{} = PedidosClientes.change_pedidos_cliente(pedidos_cliente)
    end
  end
end
