defmodule Hoge.Foos do
  @moduledoc """
  The Foos context.
  """

  import Ecto.Query, warn: false
  alias Hoge.Repo

  alias Hoge.Foos.Bar

  alias Phoenix.PubSub

  def subscribe_bars do
    PubSub.subscribe(Hoge.PubSub, "bars")
  end

  def broadcast(message, %Bar{} = bar) do
    PubSub.broadcast(Hoge.PubSub, "bars", {message, bar})
  end

  @doc """
  Returns the list of bars.

  ## Examples

      iex> list_bars()
      [%Bar{}, ...]

  """
  def list_bars do
    Repo.all(Bar)
  end

  @doc """
  Gets a single bar.

  Raises `Ecto.NoResultsError` if the Bar does not exist.

  ## Examples

      iex> get_bar!(123)
      %Bar{}

      iex> get_bar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bar!(id), do: Repo.get!(Bar, id)

  @doc """
  Creates a bar.

  ## Examples

      iex> create_bar(%{field: value})
      {:ok, %Bar{}}

      iex> create_bar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bar(attrs \\ %{}) do
    %Bar{}
    |> Bar.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, bar} = result ->
        broadcast(:created, bar)
        result

      error ->
        error
    end
  end

  @doc """
  Updates a bar.

  ## Examples

      iex> update_bar(bar, %{field: new_value})
      {:ok, %Bar{}}

      iex> update_bar(bar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bar(%Bar{} = bar, attrs) do
    bar
    |> Bar.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, bar} = result ->
        broadcast(:updated, bar)
        result

      error ->
        error
    end
  end

  @doc """
  Deletes a bar.

  ## Examples

      iex> delete_bar(bar)
      {:ok, %Bar{}}

      iex> delete_bar(bar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bar(%Bar{} = bar) do
    Repo.delete(bar)
    |> case do
      {:ok, bar} = result ->
        broadcast(:deleted, bar)
        result

      error ->
        error
    end
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bar changes.

  ## Examples

      iex> change_bar(bar)
      %Ecto.Changeset{data: %Bar{}}

  """
  def change_bar(%Bar{} = bar, attrs \\ %{}) do
    Bar.changeset(bar, attrs)
  end
end
