defmodule EjercicioWeb.PedidosClienteLive.FormComponent do
  use EjercicioWeb, :live_component

  alias Ejercicio.PedidosClientes

  @impl true
  def update(%{pedidos_cliente: pedidos_cliente} = assigns, socket) do
    changeset = PedidosClientes.change_pedidos_cliente(pedidos_cliente)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pedidos_cliente" => pedidos_cliente_params}, socket) do
    changeset =
      socket.assigns.pedidos_cliente
      |> PedidosClientes.change_pedidos_cliente(pedidos_cliente_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pedidos_cliente" => pedidos_cliente_params}, socket) do
    save_pedidos_cliente(socket, socket.assigns.action, pedidos_cliente_params)
  end

  defp save_pedidos_cliente(socket, :edit, pedidos_cliente_params) do
    case PedidosClientes.update_pedidos_cliente(socket.assigns.pedidos_cliente, pedidos_cliente_params) do
      {:ok, _pedidos_cliente} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pedidos cliente updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pedidos_cliente(socket, :new, pedidos_cliente_params) do
    case PedidosClientes.create_pedidos_cliente(pedidos_cliente_params) do
      {:ok, _pedidos_cliente} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pedidos cliente created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
