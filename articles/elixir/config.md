# Configure Elixir

The Elixir engine exposes configuration options through the [boxfile.yml](http://docs.nanobox.io/boxfile/).

### Elixir Settings
The following setting allows you to define your Elixir runtime environment.

#### runtime
Specifies which Elixir runtime and version to use. The following runtimes are available:

- elixir-1.5

```yaml
run.config:
  engine: elixir
  engine.config:
    runtime: elixir-1.5
```

#### erlang_runtime
Specifies which Erlang runtime to use. The following runtimes are available:

- erlang-18
- erlang-19
- erlang-20

```yaml
run.config:
  engine.config:
    erlang_runtime: erlang-20
```
