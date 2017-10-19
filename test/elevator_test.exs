defmodule LiftTest do
  use ExUnit.Case
  require GenServer
  doctest Lift

  test "starts with a pid" do
    {:ok, ping} = Lift.start_link()
    assert is_pid(ping)
  end

  test "responds to :ping" do
    {:ok, pid} = Lift.start_link()
    test = Lift.ping(pid)
    assert test == :pong
    test = Lift.ping(pid)
    assert test == :pong
  end

  test "responds to :pong" do
    {:ok, pid} = Lift.start_link()
    test = Lift.pong(pid)
    assert test == :ping
    test = Lift.pong(pid)
    assert test == :ping
  end
end
