defmodule EjercicioWeb.ClienteLiveTest do
  use EjercicioWeb.ConnCase

  import Phoenix.LiveViewTest
  import Ejercicio.ClientesFixtures

  @create_attrs %{amaterno: "some amaterno", apaterno: "some apaterno", email: "some email", nombre: "some nombre"}
  @update_attrs %{amaterno: "some updated amaterno", apaterno: "some updated apaterno", email: "some updated email", nombre: "some updated nombre"}
  @invalid_attrs %{amaterno: nil, apaterno: nil, email: nil, nombre: nil}

  defp create_cliente(_) do
    cliente = cliente_fixture()
    %{cliente: cliente}
  end

  describe "Index" do
    setup [:create_cliente]

    test "lists all cliente", %{conn: conn, cliente: cliente} do
      {:ok, _index_live, html} = live(conn, Routes.cliente_index_path(conn, :index))

      assert html =~ "Listing Cliente"
      assert html =~ cliente.amaterno
    end

    test "saves new cliente", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.cliente_index_path(conn, :index))

      assert index_live |> element("a", "New Cliente") |> render_click() =~
               "New Cliente"

      assert_patch(index_live, Routes.cliente_index_path(conn, :new))

      assert index_live
             |> form("#cliente-form", cliente: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#cliente-form", cliente: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.cliente_index_path(conn, :index))

      assert html =~ "Cliente created successfully"
      assert html =~ "some amaterno"
    end

    test "updates cliente in listing", %{conn: conn, cliente: cliente} do
      {:ok, index_live, _html} = live(conn, Routes.cliente_index_path(conn, :index))

      assert index_live |> element("#cliente-#{cliente.id} a", "Edit") |> render_click() =~
               "Edit Cliente"

      assert_patch(index_live, Routes.cliente_index_path(conn, :edit, cliente))

      assert index_live
             |> form("#cliente-form", cliente: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#cliente-form", cliente: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.cliente_index_path(conn, :index))

      assert html =~ "Cliente updated successfully"
      assert html =~ "some updated amaterno"
    end

    test "deletes cliente in listing", %{conn: conn, cliente: cliente} do
      {:ok, index_live, _html} = live(conn, Routes.cliente_index_path(conn, :index))

      assert index_live |> element("#cliente-#{cliente.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#cliente-#{cliente.id}")
    end
  end

  describe "Show" do
    setup [:create_cliente]

    test "displays cliente", %{conn: conn, cliente: cliente} do
      {:ok, _show_live, html} = live(conn, Routes.cliente_show_path(conn, :show, cliente))

      assert html =~ "Show Cliente"
      assert html =~ cliente.amaterno
    end

    test "updates cliente within modal", %{conn: conn, cliente: cliente} do
      {:ok, show_live, _html} = live(conn, Routes.cliente_show_path(conn, :show, cliente))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Cliente"

      assert_patch(show_live, Routes.cliente_show_path(conn, :edit, cliente))

      assert show_live
             |> form("#cliente-form", cliente: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#cliente-form", cliente: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.cliente_show_path(conn, :show, cliente))

      assert html =~ "Cliente updated successfully"
      assert html =~ "some updated amaterno"
    end
  end
end
