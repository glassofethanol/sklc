defmodule SklcTest do
  use ExUnit.Case
  doctest Sklc

  def demo_func() do
    receive do
      msg ->
        IO.puts("Hello there #{msg}")
    end
  end

  test "test bind" do
    fcm_pid1 = spawn(demo_func)
    Sklc.bind(fcm_pid1, :name)
    assert(Process.alive?(fcm_pid1))
  end
end
