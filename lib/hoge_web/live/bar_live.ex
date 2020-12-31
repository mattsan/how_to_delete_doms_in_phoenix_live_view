defmodule HogeWeb.BarLive do
  use HogeWeb, :live_view

  alias Hoge.Foos
  alias Hoge.Foos.Bar

  defguardp is_message(message) when message in [:created, :updated, :deleted]

  @impl true
  def mount(_params, _session, socket) do
    bars =
      if connected?(socket) do
        Foos.subscribe_bars()
        Foos.list_bars()
      else
        []
      end

    {:ok, assign(socket, bars: bars), temporary_assigns: [bars: []]}
  end

  @impl true
  def handle_info({message, %Bar{} = bar}, socket) when is_message(message) do
    {:noreply, assign(socket, bars: [bar])}
  end
end
