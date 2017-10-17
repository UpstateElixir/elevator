defmodule LiftTest do
  use ExUnit.Case
  doctest Lift

  test "greets the world" do
    assert Lift.hello() == :world
  end
end
