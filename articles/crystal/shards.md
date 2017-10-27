# Shards

_**This guide is a WIP and contains only placeholder content**_

[Bundler](http://bundler.io/) is included in the <a href="https://github.com/nanobox-io/nanobox-engine-ruby" target="\_blank">Ruby Engine</a> by default, and can be used in one of two ways.

You can run bundle commands with `nanobox run`:

```bash
# Run bundle commands with 'nanobox run'
nanobox run bundle install
```

Or, you can run bundle commands from a nanobox console:

```bash
# Run nanobox
nanobox run

# Run bundle commands from a nanobox console
bundle install
```

**HEADS UP**: As the ruby engine builds the environment, it will check for a `Gemfile` and, if found, run `bundle install` automatically.
