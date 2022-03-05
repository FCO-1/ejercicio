defmodule Ejercicio.ProductosTest do
  use Ejercicio.DataCase

  alias Ejercicio.Productos

  describe "categorias" do
    alias Ejercicio.Productos.Categoria

    import Ejercicio.ProductosFixtures

    @invalid_attrs %{descripcion: nil, nombre: nil}

    test "list_categorias/0 returns all categorias" do
      categoria = categoria_fixture()
      assert Productos.list_categorias() == [categoria]
    end

    test "get_categoria!/1 returns the categoria with given id" do
      categoria = categoria_fixture()
      assert Productos.get_categoria!(categoria.id) == categoria
    end

    test "create_categoria/1 with valid data creates a categoria" do
      valid_attrs = %{descripcion: "some descripcion", nombre: "some nombre"}

      assert {:ok, %Categoria{} = categoria} = Productos.create_categoria(valid_attrs)
      assert categoria.descripcion == "some descripcion"
      assert categoria.nombre == "some nombre"
    end

    test "create_categoria/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productos.create_categoria(@invalid_attrs)
    end

    test "update_categoria/2 with valid data updates the categoria" do
      categoria = categoria_fixture()
      update_attrs = %{descripcion: "some updated descripcion", nombre: "some updated nombre"}

      assert {:ok, %Categoria{} = categoria} = Productos.update_categoria(categoria, update_attrs)
      assert categoria.descripcion == "some updated descripcion"
      assert categoria.nombre == "some updated nombre"
    end

    test "update_categoria/2 with invalid data returns error changeset" do
      categoria = categoria_fixture()
      assert {:error, %Ecto.Changeset{}} = Productos.update_categoria(categoria, @invalid_attrs)
      assert categoria == Productos.get_categoria!(categoria.id)
    end

    test "delete_categoria/1 deletes the categoria" do
      categoria = categoria_fixture()
      assert {:ok, %Categoria{}} = Productos.delete_categoria(categoria)
      assert_raise Ecto.NoResultsError, fn -> Productos.get_categoria!(categoria.id) end
    end

    test "change_categoria/1 returns a categoria changeset" do
      categoria = categoria_fixture()
      assert %Ecto.Changeset{} = Productos.change_categoria(categoria)
    end
  end
end
