defmodule EjercicioWeb.CategoriaLive.Show do
  use EjercicioWeb, :live_view

  alias Ejercicio.Productos

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:categoria, Productos.get_categoria!(id))}
  end

  defp page_title(:show), do: "Show Categoria"
  defp page_title(:edit), do: "Edit Categoria"
end
