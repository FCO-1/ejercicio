defmodule EjercicioWeb.PedProdLive.FormComponent do
  use EjercicioWeb, :live_component

  alias Ejercicio.Pedidos

  @impl true
  def update(%{ped_prod: ped_prod} = assigns, socket) do
    changeset = Pedidos.change_ped_prod(ped_prod)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"ped_prod" => ped_prod_params}, socket) do
    changeset =
      socket.assigns.ped_prod
      |> Pedidos.change_ped_prod(ped_prod_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"ped_prod" => ped_prod_params}, socket) do
    save_ped_prod(socket, socket.assigns.action, ped_prod_params)
  end

  defp save_ped_prod(socket, :edit, ped_prod_params) do
    case Pedidos.update_ped_prod(socket.assigns.ped_prod, ped_prod_params) do
      {:ok, _ped_prod} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ped prod updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_ped_prod(socket, :new, ped_prod_params) do
    case Pedidos.create_ped_prod(ped_prod_params) do
      {:ok, _ped_prod} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ped prod created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
