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

  describe "ped_prod" do
    alias Ejercicio.Pedidos.PedProd

    import Ejercicio.PedidosFixtures

    @invalid_attrs %{cantidad: nil, pedido_id: nil, producto_id: nil, total: nil}

    test "list_ped_prod/0 returns all ped_prod" do
      ped_prod = ped_prod_fixture()
      assert Pedidos.list_ped_prod() == [ped_prod]
    end

    test "get_ped_prod!/1 returns the ped_prod with given id" do
      ped_prod = ped_prod_fixture()
      assert Pedidos.get_ped_prod!(ped_prod.id) == ped_prod
    end

    test "create_ped_prod/1 with valid data creates a ped_prod" do
      valid_attrs = %{cantidad: "120.5", pedido_id: "7488a646-e31f-11e4-aace-600308960662", producto_id: "7488a646-e31f-11e4-aace-600308960662", total: "120.5"}

      assert {:ok, %PedProd{} = ped_prod} = Pedidos.create_ped_prod(valid_attrs)
      assert ped_prod.cantidad == Decimal.new("120.5")
      assert ped_prod.pedido_id == "7488a646-e31f-11e4-aace-600308960662"
      assert ped_prod.producto_id == "7488a646-e31f-11e4-aace-600308960662"
      assert ped_prod.total == Decimal.new("120.5")
    end

    test "create_ped_prod/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pedidos.create_ped_prod(@invalid_attrs)
    end

    test "update_ped_prod/2 with valid data updates the ped_prod" do
      ped_prod = ped_prod_fixture()
      update_attrs = %{cantidad: "456.7", pedido_id: "7488a646-e31f-11e4-aace-600308960668", producto_id: "7488a646-e31f-11e4-aace-600308960668", total: "456.7"}

      assert {:ok, %PedProd{} = ped_prod} = Pedidos.update_ped_prod(ped_prod, update_attrs)
      assert ped_prod.cantidad == Decimal.new("456.7")
      assert ped_prod.pedido_id == "7488a646-e31f-11e4-aace-600308960668"
      assert ped_prod.producto_id == "7488a646-e31f-11e4-aace-600308960668"
      assert ped_prod.total == Decimal.new("456.7")
    end

    test "update_ped_prod/2 with invalid data returns error changeset" do
      ped_prod = ped_prod_fixture()
      assert {:error, %Ecto.Changeset{}} = Pedidos.update_ped_prod(ped_prod, @invalid_attrs)
      assert ped_prod == Pedidos.get_ped_prod!(ped_prod.id)
    end

    test "delete_ped_prod/1 deletes the ped_prod" do
      ped_prod = ped_prod_fixture()
      assert {:ok, %PedProd{}} = Pedidos.delete_ped_prod(ped_prod)
      assert_raise Ecto.NoResultsError, fn -> Pedidos.get_ped_prod!(ped_prod.id) end
    end

    test "change_ped_prod/1 returns a ped_prod changeset" do
      ped_prod = ped_prod_fixture()
      assert %Ecto.Changeset{} = Pedidos.change_ped_prod(ped_prod)
    end
  end
end
