defmodule CounterWeb.PageController do
  use CounterWeb, :controller

  def index(conn, _params) do
    count = Counter.Count.get()
    render(conn, "index.html", count: count)
  end

  def update(conn, _params) do
    {increment, _remainder} = Map.get(conn.params, "increment", "0") |> Integer.parse()
    {decrement, _remainder} = Map.get(conn.params, "decrement", "0") |> Integer.parse()
    Counter.Count.increment(increment)
    Counter.Count.decrement(decrement)
    redirect(conn, to: Routes.page_path(conn, :update))
  end
end
