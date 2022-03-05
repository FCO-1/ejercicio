defmodule EjercicioWeb.PedidoLiveTest do
  use EjercicioWeb.ConnCase

  import Phoenix.LiveViewTest
  import Ejercicio.PedidosFixtures

  @create_attrs %{importe: "120.5", serial: "some serial"}
  @update_attrs %{importe: "456.7", serial: "some updated serial"}
  @invalid_attrs %{importe: nil, serial: nil}

  defp create_pedido(_) do
    pedido = pedido_fixture()
    %{pedido: pedido}
  end

  describe "Index" do
    setup [:create_pedido]

    test "lists all pedidos", %{conn: conn, pedido: pedido} do
      {:ok, _index_live, html} = live(conn, Routes.pedido_index_path(conn, :index))

      assert html =~ "Listing Pedidos"
      assert html =~ pedido.serial
    end

    test "saves new pedido", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pedido_index_path(conn, :index))

      assert index_live |> element("a", "New Pedido") |> render_click() =~
               "New Pedido"

      assert_patch(index_live, Routes.pedido_index_path(conn, :new))

      assert index_live
             |> form("#pedido-form", pedido: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pedido-form", pedido: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pedido_index_path(conn, :index))

      assert html =~ "Pedido created successfully"
      assert html =~ "some serial"
    end

    test "updates pedido in listing", %{conn: conn, pedido: pedido} do
      {:ok, index_live, _html} = live(conn, Routes.pedido_index_path(conn, :index))

      assert index_live |> element("#pedido-#{pedido.id} a", "Edit") |> render_click() =~
               "Edit Pedido"

      assert_patch(index_live, Routes.pedido_index_path(conn, :edit, pedido))

      assert index_live
             |> form("#pedido-form", pedido: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pedido-form", pedido: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pedido_index_path(conn, :index))

      assert html =~ "Pedido updated successfully"
      assert html =~ "some updated serial"
    end

    test "deletes pedido in listing", %{conn: conn, pedido: pedido} do
      {:ok, index_live, _html} = live(conn, Routes.pedido_index_path(conn, :index))

      assert index_live |> element("#pedido-#{pedido.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pedido-#{pedido.id}")
    end
  end

  describe "Show" do
    setup [:create_pedido]

    test "displays pedido", %{conn: conn, pedido: pedido} do
      {:ok, _show_live, html} = live(conn, Routes.pedido_show_path(conn, :show, pedido))

      assert html =~ "Show Pedido"
      assert html =~ pedido.serial
    end

    test "updates pedido within modal", %{conn: conn, pedido: pedido} do
      {:ok, show_live, _html} = live(conn, Routes.pedido_show_path(conn, :show, pedido))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pedido"

      assert_patch(show_live, Routes.pedido_show_path(conn, :edit, pedido))

      assert show_live
             |> form("#pedido-form", pedido: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pedido-form", pedido: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pedido_show_path(conn, :show, pedido))

      assert html =~ "Pedido updated successfully"
      assert html =~ "some updated serial"
    end
  end
end
