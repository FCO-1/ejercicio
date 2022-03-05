defmodule EjercicioWeb.PedidoLive.Index do
  use EjercicioWeb, :live_view

  alias Ejercicio.Pedidos
  alias Ejercicio.Pedidos.Pedido

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pedidos, list_pedidos())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pedido")
    |> assign(:pedido, Pedidos.get_pedido!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pedido")
    |> assign(:pedido, %Pedido{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pedidos")
    |> assign(:pedido, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pedido = Pedidos.get_pedido!(id)
    {:ok, _} = Pedidos.delete_pedido(pedido)

    {:noreply, assign(socket, :pedidos, list_pedidos())}
  end

  defp list_pedidos do
    Pedidos.list_pedidos()
  end
end
