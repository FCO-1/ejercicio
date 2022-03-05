defmodule EjercicioWeb.PedProdLiveTest do
  use EjercicioWeb.ConnCase

  import Phoenix.LiveViewTest
  import Ejercicio.PedidosFixtures

  @create_attrs %{cantidad: "120.5", pedido_id: "7488a646-e31f-11e4-aace-600308960662", producto_id: "7488a646-e31f-11e4-aace-600308960662", total: "120.5"}
  @update_attrs %{cantidad: "456.7", pedido_id: "7488a646-e31f-11e4-aace-600308960668", producto_id: "7488a646-e31f-11e4-aace-600308960668", total: "456.7"}
  @invalid_attrs %{cantidad: nil, pedido_id: nil, producto_id: nil, total: nil}

  defp create_ped_prod(_) do
    ped_prod = ped_prod_fixture()
    %{ped_prod: ped_prod}
  end

  describe "Index" do
    setup [:create_ped_prod]

    test "lists all ped_prod", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.ped_prod_index_path(conn, :index))

      assert html =~ "Listing Ped prod"
    end

    test "saves new ped_prod", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.ped_prod_index_path(conn, :index))

      assert index_live |> element("a", "New Ped prod") |> render_click() =~
               "New Ped prod"

      assert_patch(index_live, Routes.ped_prod_index_path(conn, :new))

      assert index_live
             |> form("#ped_prod-form", ped_prod: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ped_prod-form", ped_prod: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ped_prod_index_path(conn, :index))

      assert html =~ "Ped prod created successfully"
    end

    test "updates ped_prod in listing", %{conn: conn, ped_prod: ped_prod} do
      {:ok, index_live, _html} = live(conn, Routes.ped_prod_index_path(conn, :index))

      assert index_live |> element("#ped_prod-#{ped_prod.id} a", "Edit") |> render_click() =~
               "Edit Ped prod"

      assert_patch(index_live, Routes.ped_prod_index_path(conn, :edit, ped_prod))

      assert index_live
             |> form("#ped_prod-form", ped_prod: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ped_prod-form", ped_prod: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ped_prod_index_path(conn, :index))

      assert html =~ "Ped prod updated successfully"
    end

    test "deletes ped_prod in listing", %{conn: conn, ped_prod: ped_prod} do
      {:ok, index_live, _html} = live(conn, Routes.ped_prod_index_path(conn, :index))

      assert index_live |> element("#ped_prod-#{ped_prod.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ped_prod-#{ped_prod.id}")
    end
  end

  describe "Show" do
    setup [:create_ped_prod]

    test "displays ped_prod", %{conn: conn, ped_prod: ped_prod} do
      {:ok, _show_live, html} = live(conn, Routes.ped_prod_show_path(conn, :show, ped_prod))

      assert html =~ "Show Ped prod"
    end

    test "updates ped_prod within modal", %{conn: conn, ped_prod: ped_prod} do
      {:ok, show_live, _html} = live(conn, Routes.ped_prod_show_path(conn, :show, ped_prod))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ped prod"

      assert_patch(show_live, Routes.ped_prod_show_path(conn, :edit, ped_prod))

      assert show_live
             |> form("#ped_prod-form", ped_prod: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#ped_prod-form", ped_prod: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ped_prod_show_path(conn, :show, ped_prod))

      assert html =~ "Ped prod updated successfully"
    end
  end
end
