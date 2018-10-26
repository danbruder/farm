defmodule FarmTest do
  use ExUnit.Case
  doctest Farm

  test "greets the world" do
    assert Farm.hello() == :world
  end
end
