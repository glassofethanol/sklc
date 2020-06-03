defmodule Sklc do
  def bind(pid, group)
      when is_atom(group) or (is_binary(group) and group not in [nil, false, true, :undefined]) do
    :erlang.register(group, pid)
  catch
    :error, :badarg when node(pid) != node() ->
      message = "could not bind #{inspect(pid)} because it is already registered"
      :erlang.error(ArgumentError.exception(message), [pid, group])

    :error, :badarg ->
      message =
        "could not bind #{inspect(pid)} with " <>
          "name #{inspect(group)} because its not alive or the name is already taken or given a name already"

      :erlang.error(ArgumentError.exception(message), [pid, group])
  end

  @spec demo_func :: :ok
  def demo_func() do
    receive do
      msg ->
        IO.puts("Hello there #{msg}")
    end
  end
end
