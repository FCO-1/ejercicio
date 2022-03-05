defmodule EjercicioWeb.ProductoLive.Index do
  use EjercicioWeb, :live_view

  alias Ejercicio.Productos
  alias Ejercicio.Productos.Producto

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :productos, list_productos())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Producto")
    |> assign(:producto, Productos.get_producto!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Producto")
    |> assign(:producto, %Producto{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Productos")
    |> assign(:producto, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    producto = Productos.get_producto!(id)
    {:ok, _} = Productos.delete_producto(producto)

    {:noreply, assign(socket, :productos, list_productos())}
  end

  defp list_productos do
    Productos.list_productos()
  end
end
