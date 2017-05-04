# Configure Elixir

The Elixir engine exposes configuration options through the [boxfile.yml](http://docs.nanobox.io/boxfile/).

### Elixir Settings
The following setting allows you to define your Elixir runtime environment.

#### runtime
Specifies which Elixir runtime and version to use. The following runtimes are available:

- elixir-1.0
- elixir-1.1
- elixir-1.3
- elixir-1.4

```yaml
run.config:
  engine: elixir
  engine.config:
    runtime: elixir-1.4
```
