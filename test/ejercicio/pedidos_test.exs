defmodule Ejercicio.PedidosTest do
  use Ejercicio.DataCase

  alias Ejercicio.Pedidos

  describe "pedidos" do
    alias Ejercicio.Pedidos.Pedido

    import Ejercicio.PedidosFixtures

    @invalid_attrs %{importe: nil, serial: nil}

    test "list_pedidos/0 returns all pedidos" do
      pedido = pedido_fixture()
      assert Pedidos.list_pedidos() == [pedido]
    end

    test "get_pedido!/1 returns the pedido with given id" do
      pedido = pedido_fixture()
      assert Pedidos.get_pedido!(pedido.id) == pedido
    end

    test "create_pedido/1 with valid data creates a pedido" do
      valid_attrs = %{importe: "120.5", serial: "some serial"}

      assert {:ok, %Pedido{} = pedido} = Pedidos.create_pedido(valid_attrs)
      assert pedido.importe == Decimal.new("120.5")
      assert pedido.serial == "some serial"
    end

    test "create_pedido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pedidos.create_pedido(@invalid_attrs)
    end

    test "update_pedido/2 with valid data updates the pedido" do
      pedido = pedido_fixture()
      update_attrs = %{importe: "456.7", serial: "some updated serial"}

      assert {:ok, %Pedido{} = pedido} = Pedidos.update_pedido(pedido, update_attrs)
      assert pedido.importe == Decimal.new("456.7")
      assert pedido.serial == "some updated serial"
    end

    test "update_pedido/2 with invalid data returns error changeset" do
      pedido = pedido_fixture()
      assert {:error, %Ecto.Changeset{}} = Pedidos.update_pedido(pedido, @invalid_attrs)
      assert pedido == Pedidos.get_pedido!(pedido.id)
    end

    test "delete_pedido/1 deletes the pedido" do
      pedido = pedido_fixture()
      assert {:ok, %Pedido{}} = Pedidos.delete_pedido(pedido)
      assert_raise Ecto.NoResultsError, fn -> Pedidos.get_pedido!(pedido.id) end
    end

    test "change_pedido/1 returns a pedido changeset" do
      pedido = pedido_fixture()
      assert %Ecto.Changeset{} = Pedidos.change_pedido(pedido)
    end
  end
end
