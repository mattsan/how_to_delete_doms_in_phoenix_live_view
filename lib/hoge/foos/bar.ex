defmodule Hoge.Foos.Bar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bars" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(bar, attrs) do
    bar
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
