# Bundler

The [Ruby Engine](https://github.com/nanobox-io/nanobox-engine-ruby) includes bundler and makes the `bundle` executable available from your console.

```bash
# Console into your dev container
nanobox dev console

# Run bundle commands
bundle install
```

## Bundler Runs During Build
When building your runtime, the Ruby engine checks for a `Gemfile` and, if it exists, runs `bundle install` to load your gems.

```bash
# Build your runtime
nanobox build

# As your runtime is built, Nanobox looks for a Gemfile.
# If it exists, it will run `bundle install`
```
