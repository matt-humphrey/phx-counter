defmodule Counter.Count do
    def get() do
    GenServer.call(Counter.Count.CounterServer, :get)
  end

  def increment(increment_by \\ 1) do
    GenServer.call(Counter.Count.CounterServer, {:increment, increment_by})
  end

  def decrement(decrement_by \\ 1) do
    GenServer.call(Counter.Count.CounterServer, {:decrement, decrement_by})
  end
end
