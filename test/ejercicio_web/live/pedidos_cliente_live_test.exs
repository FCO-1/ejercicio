defmodule EjercicioWeb.PedidosClienteLiveTest do
  use EjercicioWeb.ConnCase

  import Phoenix.LiveViewTest
  import Ejercicio.PedidosClientesFixtures

  @create_attrs %{cliente_id: "7488a646-e31f-11e4-aace-600308960662", pedido_id: "7488a646-e31f-11e4-aace-600308960662", status: "some status"}
  @update_attrs %{cliente_id: "7488a646-e31f-11e4-aace-600308960668", pedido_id: "7488a646-e31f-11e4-aace-600308960668", status: "some updated status"}
  @invalid_attrs %{cliente_id: nil, pedido_id: nil, status: nil}

  defp create_pedidos_cliente(_) do
    pedidos_cliente = pedidos_cliente_fixture()
    %{pedidos_cliente: pedidos_cliente}
  end

  describe "Index" do
    setup [:create_pedidos_cliente]

    test "lists all pedidos_clientes", %{conn: conn, pedidos_cliente: pedidos_cliente} do
      {:ok, _index_live, html} = live(conn, Routes.pedidos_cliente_index_path(conn, :index))

      assert html =~ "Listing Pedidos clientes"
      assert html =~ pedidos_cliente.status
    end

    test "saves new pedidos_cliente", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pedidos_cliente_index_path(conn, :index))

      assert index_live |> element("a", "New Pedidos cliente") |> render_click() =~
               "New Pedidos cliente"

      assert_patch(index_live, Routes.pedidos_cliente_index_path(conn, :new))

      assert index_live
             |> form("#pedidos_cliente-form", pedidos_cliente: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pedidos_cliente-form", pedidos_cliente: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pedidos_cliente_index_path(conn, :index))

      assert html =~ "Pedidos cliente created successfully"
      assert html =~ "some status"
    end

    test "updates pedidos_cliente in listing", %{conn: conn, pedidos_cliente: pedidos_cliente} do
      {:ok, index_live, _html} = live(conn, Routes.pedidos_cliente_index_path(conn, :index))

      assert index_live |> element("#pedidos_cliente-#{pedidos_cliente.id} a", "Edit") |> render_click() =~
               "Edit Pedidos cliente"

      assert_patch(index_live, Routes.pedidos_cliente_index_path(conn, :edit, pedidos_cliente))

      assert index_live
             |> form("#pedidos_cliente-form", pedidos_cliente: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pedidos_cliente-form", pedidos_cliente: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pedidos_cliente_index_path(conn, :index))

      assert html =~ "Pedidos cliente updated successfully"
      assert html =~ "some updated status"
    end

    test "deletes pedidos_cliente in listing", %{conn: conn, pedidos_cliente: pedidos_cliente} do
      {:ok, index_live, _html} = live(conn, Routes.pedidos_cliente_index_path(conn, :index))

      assert index_live |> element("#pedidos_cliente-#{pedidos_cliente.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pedidos_cliente-#{pedidos_cliente.id}")
    end
  end

  describe "Show" do
    setup [:create_pedidos_cliente]

    test "displays pedidos_cliente", %{conn: conn, pedidos_cliente: pedidos_cliente} do
      {:ok, _show_live, html} = live(conn, Routes.pedidos_cliente_show_path(conn, :show, pedidos_cliente))

      assert html =~ "Show Pedidos cliente"
      assert html =~ pedidos_cliente.status
    end

    test "updates pedidos_cliente within modal", %{conn: conn, pedidos_cliente: pedidos_cliente} do
      {:ok, show_live, _html} = live(conn, Routes.pedidos_cliente_show_path(conn, :show, pedidos_cliente))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pedidos cliente"

      assert_patch(show_live, Routes.pedidos_cliente_show_path(conn, :edit, pedidos_cliente))

      assert show_live
             |> form("#pedidos_cliente-form", pedidos_cliente: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pedidos_cliente-form", pedidos_cliente: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pedidos_cliente_show_path(conn, :show, pedidos_cliente))

      assert html =~ "Pedidos cliente updated successfully"
      assert html =~ "some updated status"
    end
  end
end
