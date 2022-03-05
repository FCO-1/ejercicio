defmodule EjercicioWeb.CategoriaLive.Index do
  use EjercicioWeb, :live_view

  alias Ejercicio.Productos
  alias Ejercicio.Productos.Categoria

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :categorias, list_categorias())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Categoria")
    |> assign(:categoria, Productos.get_categoria!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Categoria")
    |> assign(:categoria, %Categoria{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Categorias")
    |> assign(:categoria, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    categoria = Productos.get_categoria!(id)
    {:ok, _} = Productos.delete_categoria(categoria)

    {:noreply, assign(socket, :categorias, list_categorias())}
  end

  defp list_categorias do
    Productos.list_categorias()
  end
end
