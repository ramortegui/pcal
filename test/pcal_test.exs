defmodule PcalTest do
  use ExUnit.Case
  doctest Pcal

  test "greets the world" do
    assert Pcal.hello() == :world
  end
end
