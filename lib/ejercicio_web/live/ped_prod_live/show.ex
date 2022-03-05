defmodule EjercicioWeb.PedProdLive.Show do
  use EjercicioWeb, :live_view

  alias Ejercicio.Pedidos

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ped_prod, Pedidos.get_ped_prod!(id))}
  end

  defp page_title(:show), do: "Show Ped prod"
  defp page_title(:edit), do: "Edit Ped prod"
end
