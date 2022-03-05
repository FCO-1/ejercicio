defmodule EjercicioWeb.PedidoLive.FormComponent do
  use EjercicioWeb, :live_component

  alias Ejercicio.Pedidos

  @impl true
  def update(%{pedido: pedido} = assigns, socket) do
    changeset = Pedidos.change_pedido(pedido)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pedido" => pedido_params}, socket) do
    changeset =
      socket.assigns.pedido
      |> Pedidos.change_pedido(pedido_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pedido" => pedido_params}, socket) do
    save_pedido(socket, socket.assigns.action, pedido_params)
  end

  defp save_pedido(socket, :edit, pedido_params) do
    case Pedidos.update_pedido(socket.assigns.pedido, pedido_params) do
      {:ok, _pedido} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pedido updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pedido(socket, :new, pedido_params) do
    case Pedidos.create_pedido(pedido_params) do
      {:ok, _pedido} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pedido created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
