defmodule EjercicioWeb.CategoriaLiveTest do
  use EjercicioWeb.ConnCase

  import Phoenix.LiveViewTest
  import Ejercicio.ProductosFixtures

  @create_attrs %{descripcion: "some descripcion", nombre: "some nombre"}
  @update_attrs %{descripcion: "some updated descripcion", nombre: "some updated nombre"}
  @invalid_attrs %{descripcion: nil, nombre: nil}

  defp create_categoria(_) do
    categoria = categoria_fixture()
    %{categoria: categoria}
  end

  describe "Index" do
    setup [:create_categoria]

    test "lists all categorias", %{conn: conn, categoria: categoria} do
      {:ok, _index_live, html} = live(conn, Routes.categoria_index_path(conn, :index))

      assert html =~ "Listing Categorias"
      assert html =~ categoria.descripcion
    end

    test "saves new categoria", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.categoria_index_path(conn, :index))

      assert index_live |> element("a", "New Categoria") |> render_click() =~
               "New Categoria"

      assert_patch(index_live, Routes.categoria_index_path(conn, :new))

      assert index_live
             |> form("#categoria-form", categoria: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#categoria-form", categoria: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.categoria_index_path(conn, :index))

      assert html =~ "Categoria created successfully"
      assert html =~ "some descripcion"
    end

    test "updates categoria in listing", %{conn: conn, categoria: categoria} do
      {:ok, index_live, _html} = live(conn, Routes.categoria_index_path(conn, :index))

      assert index_live |> element("#categoria-#{categoria.id} a", "Edit") |> render_click() =~
               "Edit Categoria"

      assert_patch(index_live, Routes.categoria_index_path(conn, :edit, categoria))

      assert index_live
             |> form("#categoria-form", categoria: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#categoria-form", categoria: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.categoria_index_path(conn, :index))

      assert html =~ "Categoria updated successfully"
      assert html =~ "some updated descripcion"
    end

    test "deletes categoria in listing", %{conn: conn, categoria: categoria} do
      {:ok, index_live, _html} = live(conn, Routes.categoria_index_path(conn, :index))

      assert index_live |> element("#categoria-#{categoria.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#categoria-#{categoria.id}")
    end
  end

  describe "Show" do
    setup [:create_categoria]

    test "displays categoria", %{conn: conn, categoria: categoria} do
      {:ok, _show_live, html} = live(conn, Routes.categoria_show_path(conn, :show, categoria))

      assert html =~ "Show Categoria"
      assert html =~ categoria.descripcion
    end

    test "updates categoria within modal", %{conn: conn, categoria: categoria} do
      {:ok, show_live, _html} = live(conn, Routes.categoria_show_path(conn, :show, categoria))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Categoria"

      assert_patch(show_live, Routes.categoria_show_path(conn, :edit, categoria))

      assert show_live
             |> form("#categoria-form", categoria: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#categoria-form", categoria: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.categoria_show_path(conn, :show, categoria))

      assert html =~ "Categoria updated successfully"
      assert html =~ "some updated descripcion"
    end
  end
end
