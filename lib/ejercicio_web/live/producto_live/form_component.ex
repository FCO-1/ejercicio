defmodule EjercicioWeb.ProductoLive.FormComponent do
  use EjercicioWeb, :live_component

  alias Ejercicio.Productos

  @impl true
  def update(%{producto: producto} = assigns, socket) do
    changeset = Productos.change_producto(producto)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"producto" => producto_params}, socket) do
    changeset =
      socket.assigns.producto
      |> Productos.change_producto(producto_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"producto" => producto_params}, socket) do
    save_producto(socket, socket.assigns.action, producto_params)
  end

  defp save_producto(socket, :edit, producto_params) do
    case Productos.update_producto(socket.assigns.producto, producto_params) do
      {:ok, _producto} ->
        {:noreply,
         socket
         |> put_flash(:info, "Producto updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_producto(socket, :new, producto_params) do
    case Productos.create_producto(producto_params) do
      {:ok, _producto} ->
        {:noreply,
         socket
         |> put_flash(:info, "Producto created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
