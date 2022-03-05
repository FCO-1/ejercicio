defmodule Ejercicio.Productos do
  @moduledoc """
  The Productos context.
  """

  import Ecto.Query, warn: false
  alias Ejercicio.Repo

  alias Ejercicio.Productos.Categoria

  @doc """
  Returns the list of categorias.

  ## Examples

      iex> list_categorias()
      [%Categoria{}, ...]

  """
  def list_categorias do
    Repo.all(Categoria)
  end

  @doc """
  Gets a single categoria.

  Raises `Ecto.NoResultsError` if the Categoria does not exist.

  ## Examples

      iex> get_categoria!(123)
      %Categoria{}

      iex> get_categoria!(456)
      ** (Ecto.NoResultsError)

  """
  def get_categoria!(id), do: Repo.get!(Categoria, id)

  @doc """
  Creates a categoria.

  ## Examples

      iex> create_categoria(%{field: value})
      {:ok, %Categoria{}}

      iex> create_categoria(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_categoria(attrs \\ %{}) do
    %Categoria{}
    |> Categoria.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a categoria.

  ## Examples

      iex> update_categoria(categoria, %{field: new_value})
      {:ok, %Categoria{}}

      iex> update_categoria(categoria, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_categoria(%Categoria{} = categoria, attrs) do
    categoria
    |> Categoria.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a categoria.

  ## Examples

      iex> delete_categoria(categoria)
      {:ok, %Categoria{}}

      iex> delete_categoria(categoria)
      {:error, %Ecto.Changeset{}}

  """
  def delete_categoria(%Categoria{} = categoria) do
    Repo.delete(categoria)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking categoria changes.

  ## Examples

      iex> change_categoria(categoria)
      %Ecto.Changeset{data: %Categoria{}}

  """
  def change_categoria(%Categoria{} = categoria, attrs \\ %{}) do
    Categoria.changeset(categoria, attrs)
  end

  alias Ejercicio.Productos.Producto

  @doc """
  Returns the list of productos.

  ## Examples

      iex> list_productos()
      [%Producto{}, ...]

  """
  def list_productos do
    Repo.all(Producto)
  end

  @doc """
  Gets a single producto.

  Raises `Ecto.NoResultsError` if the Producto does not exist.

  ## Examples

      iex> get_producto!(123)
      %Producto{}

      iex> get_producto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_producto!(id), do: Repo.get!(Producto, id)

  @doc """
  Creates a producto.

  ## Examples

      iex> create_producto(%{field: value})
      {:ok, %Producto{}}

      iex> create_producto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_producto(attrs \\ %{}) do
    %Producto{}
    |> Producto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a producto.

  ## Examples

      iex> update_producto(producto, %{field: new_value})
      {:ok, %Producto{}}

      iex> update_producto(producto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_producto(%Producto{} = producto, attrs) do
    producto
    |> Producto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a producto.

  ## Examples

      iex> delete_producto(producto)
      {:ok, %Producto{}}

      iex> delete_producto(producto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_producto(%Producto{} = producto) do
    Repo.delete(producto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking producto changes.

  ## Examples

      iex> change_producto(producto)
      %Ecto.Changeset{data: %Producto{}}

  """
  def change_producto(%Producto{} = producto, attrs \\ %{}) do
    Producto.changeset(producto, attrs)
  end
end
