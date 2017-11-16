defmodule LiftTest do
  use ExUnit.Case
  require GenServer
  doctest Lift

  test "starts with a pid" do
    {:ok, pid} = Lift.start_link()
    assert is_pid(pid)
  end

  test "starts with expected state" do
    {:ok, pid} = Lift.start_link()
    assert Lift.info(pid) == %{
      floor: 0,
      open: true,
      buttons: %{},
      direction: :asc,
      destination: nil
    }
  end

  test "moves to a floor" do
    {:ok, pid} = Lift.start_link()
    assert Lift.move(pid, 4) == %{
      floor: 0,
      open: true,
      buttons: %{},
      direction: :asc,
      destination: 4
    }
  end

end
