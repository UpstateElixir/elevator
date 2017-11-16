defmodule Lift do
  require Logger
  use GenServer

  @moduledoc """

  ## Examples
    iex> {:ok, pid} = Lift.start_link()
    iex> Lift.move(pid, 3)
    %{floor: 0, open: true, buttons: %{}, direction: :asc, destination: 3}
  """

  def start_link() do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    {:ok, %{
      floor: 0,
      open: true,
      buttons: %{},
      direction: :asc,
      destination: nil
    }}
  end

  def info(pid) do
    GenServer.call(pid, {:info})
  end

  def move(pid, floor) do
    GenServer.call(pid, {:move, floor})
  end

  def handle_call({:info}, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:move, floor}, _floor, state) do
    state = state
    |> Map.replace(:destination, floor)
    {:reply, state, state}
  end
end
