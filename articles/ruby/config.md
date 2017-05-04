# Configure Ruby
The <a href="https://github.com/nanobox-io/nanobox-engine-ruby" target="\_blank">Ruby Engine</a> exposes configuration options through the <a href="http://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a>.

#### runtime
Specifies which Ruby runtime and version to use. The following runtimes are available:

- ruby-1.9
- ruby-2.0
- ruby-2.1
- ruby-2.2
- ruby-2.3 *(default)*
- ruby-2.4
- jruby-1.6
- jruby-1.7
- jruby-9.0

```yaml
run.config:
  engine: ruby
  engine.config:
    runtime: ruby-2.3
```
