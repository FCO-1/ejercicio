defmodule Ejercicio.ClientesTest do
  use Ejercicio.DataCase

  alias Ejercicio.Clientes

  describe "cliente" do
    alias Ejercicio.Clientes.Cliente

    import Ejercicio.ClientesFixtures

    @invalid_attrs %{amaterno: nil, apaterno: nil, email: nil, nombre: nil}

    test "list_cliente/0 returns all cliente" do
      cliente = cliente_fixture()
      assert Clientes.list_cliente() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Clientes.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      valid_attrs = %{amaterno: "some amaterno", apaterno: "some apaterno", email: "some email", nombre: "some nombre"}

      assert {:ok, %Cliente{} = cliente} = Clientes.create_cliente(valid_attrs)
      assert cliente.amaterno == "some amaterno"
      assert cliente.apaterno == "some apaterno"
      assert cliente.email == "some email"
      assert cliente.nombre == "some nombre"
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clientes.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      update_attrs = %{amaterno: "some updated amaterno", apaterno: "some updated apaterno", email: "some updated email", nombre: "some updated nombre"}

      assert {:ok, %Cliente{} = cliente} = Clientes.update_cliente(cliente, update_attrs)
      assert cliente.amaterno == "some updated amaterno"
      assert cliente.apaterno == "some updated apaterno"
      assert cliente.email == "some updated email"
      assert cliente.nombre == "some updated nombre"
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Clientes.update_cliente(cliente, @invalid_attrs)
      assert cliente == Clientes.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Clientes.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Clientes.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Clientes.change_cliente(cliente)
    end
  end
end
