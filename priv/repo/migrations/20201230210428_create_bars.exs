defmodule Hoge.Repo.Migrations.CreateBars do
  use Ecto.Migration

  def change do
    create table(:bars) do
      add :name, :string

      timestamps()
    end

  end
end
