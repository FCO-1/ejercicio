defmodule EjercicioWeb.PedidosClienteLive.Show do
  use EjercicioWeb, :live_view

  alias Ejercicio.PedidosClientes

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pedidos_cliente, PedidosClientes.get_pedidos_cliente!(id))}
  end

  defp page_title(:show), do: "Show Pedidos cliente"
  defp page_title(:edit), do: "Edit Pedidos cliente"
end
