defmodule EjercicioWeb.ProductoLiveTest do
  use EjercicioWeb.ConnCase

  import Phoenix.LiveViewTest
  import Ejercicio.ProductosFixtures

  @create_attrs %{cantidad: "120.5", descripcion: "some descripcion", nombre: "some nombre", sku: "some sku", total: "120.5"}
  @update_attrs %{cantidad: "456.7", descripcion: "some updated descripcion", nombre: "some updated nombre", sku: "some updated sku", total: "456.7"}
  @invalid_attrs %{cantidad: nil, descripcion: nil, nombre: nil, sku: nil, total: nil}

  defp create_producto(_) do
    producto = producto_fixture()
    %{producto: producto}
  end

  describe "Index" do
    setup [:create_producto]

    test "lists all productos", %{conn: conn, producto: producto} do
      {:ok, _index_live, html} = live(conn, Routes.producto_index_path(conn, :index))

      assert html =~ "Listing Productos"
      assert html =~ producto.descripcion
    end

    test "saves new producto", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.producto_index_path(conn, :index))

      assert index_live |> element("a", "New Producto") |> render_click() =~
               "New Producto"

      assert_patch(index_live, Routes.producto_index_path(conn, :new))

      assert index_live
             |> form("#producto-form", producto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#producto-form", producto: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.producto_index_path(conn, :index))

      assert html =~ "Producto created successfully"
      assert html =~ "some descripcion"
    end

    test "updates producto in listing", %{conn: conn, producto: producto} do
      {:ok, index_live, _html} = live(conn, Routes.producto_index_path(conn, :index))

      assert index_live |> element("#producto-#{producto.id} a", "Edit") |> render_click() =~
               "Edit Producto"

      assert_patch(index_live, Routes.producto_index_path(conn, :edit, producto))

      assert index_live
             |> form("#producto-form", producto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#producto-form", producto: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.producto_index_path(conn, :index))

      assert html =~ "Producto updated successfully"
      assert html =~ "some updated descripcion"
    end

    test "deletes producto in listing", %{conn: conn, producto: producto} do
      {:ok, index_live, _html} = live(conn, Routes.producto_index_path(conn, :index))

      assert index_live |> element("#producto-#{producto.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#producto-#{producto.id}")
    end
  end

  describe "Show" do
    setup [:create_producto]

    test "displays producto", %{conn: conn, producto: producto} do
      {:ok, _show_live, html} = live(conn, Routes.producto_show_path(conn, :show, producto))

      assert html =~ "Show Producto"
      assert html =~ producto.descripcion
    end

    test "updates producto within modal", %{conn: conn, producto: producto} do
      {:ok, show_live, _html} = live(conn, Routes.producto_show_path(conn, :show, producto))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Producto"

      assert_patch(show_live, Routes.producto_show_path(conn, :edit, producto))

      assert show_live
             |> form("#producto-form", producto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#producto-form", producto: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.producto_show_path(conn, :show, producto))

      assert html =~ "Producto updated successfully"
      assert html =~ "some updated descripcion"
    end
  end
end
