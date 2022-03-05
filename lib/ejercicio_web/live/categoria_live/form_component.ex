defmodule EjercicioWeb.CategoriaLive.FormComponent do
  use EjercicioWeb, :live_component

  alias Ejercicio.Productos

  @impl true
  def update(%{categoria: categoria} = assigns, socket) do
    changeset = Productos.change_categoria(categoria)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"categoria" => categoria_params}, socket) do
    changeset =
      socket.assigns.categoria
      |> Productos.change_categoria(categoria_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"categoria" => categoria_params}, socket) do
    save_categoria(socket, socket.assigns.action, categoria_params)
  end

  defp save_categoria(socket, :edit, categoria_params) do
    case Productos.update_categoria(socket.assigns.categoria, categoria_params) do
      {:ok, _categoria} ->
        {:noreply,
         socket
         |> put_flash(:info, "Categoria updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_categoria(socket, :new, categoria_params) do
    case Productos.create_categoria(categoria_params) do
      {:ok, _categoria} ->
        {:noreply,
         socket
         |> put_flash(:info, "Categoria created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
