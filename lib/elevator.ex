defmodule Lift do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, %{})
  end

  def ping(pid, pid2) do
    GenServer.cast(pid, {:ping, pid2})
  end

  def pong(pid, pid2) do
    GenServer.cast(pid, {:pong, pid2})
  end

  def handle_cast({:ping, other}, state) do
    :timer.sleep 500
    IO.puts("Ping -->")
    GenServer.cast(other, {:pong, self()})
    {:noreply, state}
  end

  def handle_cast({:pong, other}, state) do
    :timer.sleep 500
    IO.puts("<-- Pong")
    GenServer.cast(other, {:ping, self()})
    {:noreply, state}
  end
end
