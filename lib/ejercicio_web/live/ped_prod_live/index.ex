defmodule EjercicioWeb.PedProdLive.Index do
  use EjercicioWeb, :live_view

  alias Ejercicio.Pedidos
  alias Ejercicio.Pedidos.PedProd

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :ped_prod_collection, list_ped_prod())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ped prod")
    |> assign(:ped_prod, Pedidos.get_ped_prod!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Ped prod")
    |> assign(:ped_prod, %PedProd{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Ped prod")
    |> assign(:ped_prod, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ped_prod = Pedidos.get_ped_prod!(id)
    {:ok, _} = Pedidos.delete_ped_prod(ped_prod)

    {:noreply, assign(socket, :ped_prod_collection, list_ped_prod())}
  end

  defp list_ped_prod do
    Pedidos.list_ped_prod()
  end
end
