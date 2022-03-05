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

  describe "productos" do
    alias Ejercicio.Productos.Producto

    import Ejercicio.ProductosFixtures

    @invalid_attrs %{cantidad: nil, descripcion: nil, nombre: nil, sku: nil, total: nil}

    test "list_productos/0 returns all productos" do
      producto = producto_fixture()
      assert Productos.list_productos() == [producto]
    end

    test "get_producto!/1 returns the producto with given id" do
      producto = producto_fixture()
      assert Productos.get_producto!(producto.id) == producto
    end

    test "create_producto/1 with valid data creates a producto" do
      valid_attrs = %{cantidad: "120.5", descripcion: "some descripcion", nombre: "some nombre", sku: "some sku", total: "120.5"}

      assert {:ok, %Producto{} = producto} = Productos.create_producto(valid_attrs)
      assert producto.cantidad == Decimal.new("120.5")
      assert producto.descripcion == "some descripcion"
      assert producto.nombre == "some nombre"
      assert producto.sku == "some sku"
      assert producto.total == Decimal.new("120.5")
    end

    test "create_producto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productos.create_producto(@invalid_attrs)
    end

    test "update_producto/2 with valid data updates the producto" do
      producto = producto_fixture()
      update_attrs = %{cantidad: "456.7", descripcion: "some updated descripcion", nombre: "some updated nombre", sku: "some updated sku", total: "456.7"}

      assert {:ok, %Producto{} = producto} = Productos.update_producto(producto, update_attrs)
      assert producto.cantidad == Decimal.new("456.7")
      assert producto.descripcion == "some updated descripcion"
      assert producto.nombre == "some updated nombre"
      assert producto.sku == "some updated sku"
      assert producto.total == Decimal.new("456.7")
    end

    test "update_producto/2 with invalid data returns error changeset" do
      producto = producto_fixture()
      assert {:error, %Ecto.Changeset{}} = Productos.update_producto(producto, @invalid_attrs)
      assert producto == Productos.get_producto!(producto.id)
    end

    test "delete_producto/1 deletes the producto" do
      producto = producto_fixture()
      assert {:ok, %Producto{}} = Productos.delete_producto(producto)
      assert_raise Ecto.NoResultsError, fn -> Productos.get_producto!(producto.id) end
    end

    test "change_producto/1 returns a producto changeset" do
      producto = producto_fixture()
      assert %Ecto.Changeset{} = Productos.change_producto(producto)
    end
  end
end
