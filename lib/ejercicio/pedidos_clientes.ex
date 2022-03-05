defmodule Ejercicio.PedidosClientes do
  @moduledoc """
  The PedidosClientes context.
  """

  import Ecto.Query, warn: false
  alias Ejercicio.Repo

  alias Ejercicio.PedidosClientes.PedidosCliente

  @doc """
  Returns the list of pedidos_clientes.

  ## Examples

      iex> list_pedidos_clientes()
      [%PedidosCliente{}, ...]

  """
  def list_pedidos_clientes do
    Repo.all(PedidosCliente)
  end

  @doc """
  Gets a single pedidos_cliente.

  Raises `Ecto.NoResultsError` if the Pedidos cliente does not exist.

  ## Examples

      iex> get_pedidos_cliente!(123)
      %PedidosCliente{}

      iex> get_pedidos_cliente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pedidos_cliente!(id), do: Repo.get!(PedidosCliente, id)

  @doc """
  Creates a pedidos_cliente.

  ## Examples

      iex> create_pedidos_cliente(%{field: value})
      {:ok, %PedidosCliente{}}

      iex> create_pedidos_cliente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pedidos_cliente(attrs \\ %{}) do
    %PedidosCliente{}
    |> PedidosCliente.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pedidos_cliente.

  ## Examples

      iex> update_pedidos_cliente(pedidos_cliente, %{field: new_value})
      {:ok, %PedidosCliente{}}

      iex> update_pedidos_cliente(pedidos_cliente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pedidos_cliente(%PedidosCliente{} = pedidos_cliente, attrs) do
    pedidos_cliente
    |> PedidosCliente.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pedidos_cliente.

  ## Examples

      iex> delete_pedidos_cliente(pedidos_cliente)
      {:ok, %PedidosCliente{}}

      iex> delete_pedidos_cliente(pedidos_cliente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pedidos_cliente(%PedidosCliente{} = pedidos_cliente) do
    Repo.delete(pedidos_cliente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pedidos_cliente changes.

  ## Examples

      iex> change_pedidos_cliente(pedidos_cliente)
      %Ecto.Changeset{data: %PedidosCliente{}}

  """
  def change_pedidos_cliente(%PedidosCliente{} = pedidos_cliente, attrs \\ %{}) do
    PedidosCliente.changeset(pedidos_cliente, attrs)
  end
end
