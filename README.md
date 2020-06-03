# Sklc

Allows the binding of Pids to names for later query

**Only supports alive pids**

## Example

```elixir
iex(1)> fcm_pid = spawn(Sklc, :demo_func, [])
#PID<0.142.0>
iex(2)> Process.alive?(fcm_pid)
true
iex(3)> Sklc.bind(fcm_pid, :random_group)
iex(4)> send :random_group, "fcm_group"
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sklc` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sklc, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sklc](https://hexdocs.pm/sklc).
