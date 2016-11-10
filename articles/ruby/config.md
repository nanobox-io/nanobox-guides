# Configure Ruby

The Ruby engine exposes configuration options through the [boxfile.yml](http://docs.nanobox.io/boxfile/).

#### runtime
Specifies which Ruby runtime and version to use. The following runtimes are available:

- ruby-1.9
- ruby-2.0
- ruby-2.1
- ruby-2.2
- ruby-2.3 *(default)*
- jruby-1.6
- jruby-1.7
- jruby-9.0

```yaml
run.config:
  engine: ruby
  
  engine.config:
    runtime: ruby-2.3
```
