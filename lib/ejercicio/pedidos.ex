defmodule Ejercicio.Pedidos do
  @moduledoc """
  The Pedidos context.
  """

  import Ecto.Query, warn: false
  alias Ejercicio.Repo

  alias Ejercicio.Pedidos.Pedido

  @doc """
  Returns the list of pedidos.

  ## Examples

      iex> list_pedidos()
      [%Pedido{}, ...]

  """
  def list_pedidos do
    Repo.all(Pedido)
  end

  @doc """
  Gets a single pedido.

  Raises `Ecto.NoResultsError` if the Pedido does not exist.

  ## Examples

      iex> get_pedido!(123)
      %Pedido{}

      iex> get_pedido!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pedido!(id), do: Repo.get!(Pedido, id)

  @doc """
  Creates a pedido.

  ## Examples

      iex> create_pedido(%{field: value})
      {:ok, %Pedido{}}

      iex> create_pedido(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pedido(attrs \\ %{}) do
    %Pedido{}
    |> Pedido.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pedido.

  ## Examples

      iex> update_pedido(pedido, %{field: new_value})
      {:ok, %Pedido{}}

      iex> update_pedido(pedido, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pedido(%Pedido{} = pedido, attrs) do
    pedido
    |> Pedido.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pedido.

  ## Examples

      iex> delete_pedido(pedido)
      {:ok, %Pedido{}}

      iex> delete_pedido(pedido)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pedido(%Pedido{} = pedido) do
    Repo.delete(pedido)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pedido changes.

  ## Examples

      iex> change_pedido(pedido)
      %Ecto.Changeset{data: %Pedido{}}

  """
  def change_pedido(%Pedido{} = pedido, attrs \\ %{}) do
    Pedido.changeset(pedido, attrs)
  end

  alias Ejercicio.Pedidos.PedProd

  @doc """
  Returns the list of ped_prod.

  ## Examples

      iex> list_ped_prod()
      [%PedProd{}, ...]

  """
  def list_ped_prod do
    Repo.all(PedProd)
  end

  @doc """
  Gets a single ped_prod.

  Raises `Ecto.NoResultsError` if the Ped prod does not exist.

  ## Examples

      iex> get_ped_prod!(123)
      %PedProd{}

      iex> get_ped_prod!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ped_prod!(id), do: Repo.get!(PedProd, id)

  @doc """
  Creates a ped_prod.

  ## Examples

      iex> create_ped_prod(%{field: value})
      {:ok, %PedProd{}}

      iex> create_ped_prod(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ped_prod(attrs \\ %{}) do
    %PedProd{}
    |> PedProd.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ped_prod.

  ## Examples

      iex> update_ped_prod(ped_prod, %{field: new_value})
      {:ok, %PedProd{}}

      iex> update_ped_prod(ped_prod, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ped_prod(%PedProd{} = ped_prod, attrs) do
    ped_prod
    |> PedProd.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ped_prod.

  ## Examples

      iex> delete_ped_prod(ped_prod)
      {:ok, %PedProd{}}

      iex> delete_ped_prod(ped_prod)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ped_prod(%PedProd{} = ped_prod) do
    Repo.delete(ped_prod)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ped_prod changes.

  ## Examples

      iex> change_ped_prod(ped_prod)
      %Ecto.Changeset{data: %PedProd{}}

  """
  def change_ped_prod(%PedProd{} = ped_prod, attrs \\ %{}) do
    PedProd.changeset(ped_prod, attrs)
  end
end
