# Bundler

The [Ruby Engine](https://github.com/nanobox-io/nanobox-engine-ruby) includes bundler and makes the `bundle` executable available from your console. The engine also checks for a `Gemfile` and, if found, runs `bundle install` as the environment builds.

```bash
# Run nanobox
nanobox run

# Run bundle commands
bundle install
```
