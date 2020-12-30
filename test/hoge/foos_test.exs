defmodule Hoge.FoosTest do
  use Hoge.DataCase

  alias Hoge.Foos

  describe "bars" do
    alias Hoge.Foos.Bar

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def bar_fixture(attrs \\ %{}) do
      {:ok, bar} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Foos.create_bar()

      bar
    end

    test "list_bars/0 returns all bars" do
      bar = bar_fixture()
      assert Foos.list_bars() == [bar]
    end

    test "get_bar!/1 returns the bar with given id" do
      bar = bar_fixture()
      assert Foos.get_bar!(bar.id) == bar
    end

    test "create_bar/1 with valid data creates a bar" do
      assert {:ok, %Bar{} = bar} = Foos.create_bar(@valid_attrs)
      assert bar.name == "some name"
    end

    test "create_bar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Foos.create_bar(@invalid_attrs)
    end

    test "update_bar/2 with valid data updates the bar" do
      bar = bar_fixture()
      assert {:ok, %Bar{} = bar} = Foos.update_bar(bar, @update_attrs)
      assert bar.name == "some updated name"
    end

    test "update_bar/2 with invalid data returns error changeset" do
      bar = bar_fixture()
      assert {:error, %Ecto.Changeset{}} = Foos.update_bar(bar, @invalid_attrs)
      assert bar == Foos.get_bar!(bar.id)
    end

    test "delete_bar/1 deletes the bar" do
      bar = bar_fixture()
      assert {:ok, %Bar{}} = Foos.delete_bar(bar)
      assert_raise Ecto.NoResultsError, fn -> Foos.get_bar!(bar.id) end
    end

    test "change_bar/1 returns a bar changeset" do
      bar = bar_fixture()
      assert %Ecto.Changeset{} = Foos.change_bar(bar)
    end
  end
end
