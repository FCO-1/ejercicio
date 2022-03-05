defmodule EjercicioWeb.PedidosClienteLive.Index do
  use EjercicioWeb, :live_view

  alias Ejercicio.PedidosClientes
  alias Ejercicio.PedidosClientes.PedidosCliente

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pedidos_clientes, list_pedidos_clientes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pedidos cliente")
    |> assign(:pedidos_cliente, PedidosClientes.get_pedidos_cliente!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pedidos cliente")
    |> assign(:pedidos_cliente, %PedidosCliente{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pedidos clientes")
    |> assign(:pedidos_cliente, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pedidos_cliente = PedidosClientes.get_pedidos_cliente!(id)
    {:ok, _} = PedidosClientes.delete_pedidos_cliente(pedidos_cliente)

    {:noreply, assign(socket, :pedidos_clientes, list_pedidos_clientes())}
  end

  defp list_pedidos_clientes do
    PedidosClientes.list_pedidos_clientes()
  end
end
