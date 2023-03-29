defmodule Counter.Count.CounterServer do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  # Server callback functions

  @impl true
  def init(count) do
    {:ok, count}
  end

  @impl true
  def handle_call(:get, _from, count) do
    {:reply, count, count}
  end

  @impl true
  def handle_call({:increment, increment_by}, _from, count) do
    {:reply, count + increment_by, count + increment_by}
  end

  @impl true
  def handle_call({:decrement, decrement_by}, _from, count) do
    {:reply, count - decrement_by, count - decrement_by}
  end
end
