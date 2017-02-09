# Existing Phoenix App
Part of what makes nanobox so useful is you don't even need Elixir or Phoenix installed on your local machine to use them.

## Setup

#### cd into your Phoenix app
Change into an existing project folder:

```bash
cd your-phoenix-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Elixir <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>. You'll also want to add `inotify-tools` as a development package so it'll be available in your local dev environment:

```yaml
run.config:
  engine: elixir
  dev_packages:
    - inotify-tools
```

## Configure Phoenix

#### Update to Port 8080
To connect to the public network, you need to configure your app to listen on port 8080 by modifying your `config/dev.exs` and `config/prod.exs`:

```elixir
# /config/dev.exs
config :myapp, Myapp.Endpoint,
  http: [port: 8080],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []
```

```elixir
# /config/prod.exs
config :myapp, Myapp.Endpoint,
  http: [port: 8080],
  url: [host: "example.com", port: 8080],
  cache_static_manifest: "priv/static/manifest.json"
```

## Fetch your Dependencies
Inside of your Nanobox console, fetch your app's dependencies:

```bash
mix deps.get
```

## Run the app

```bash
mix phoenix.server
```

Visit your app at <a href="http://phoenix.dev" target="\_blank">phoenix.dev</a>

## Explore
With Nanobox, you have everything you need develop and run your Phoenix app:

```bash
# drop into a Nanobox console
nanobox run

# where elixir is installed,
elixir -v

# your packages are available,
mix list

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/elixir/phoenix/add-a-database)
* [Frontend Javascript](/elixir/phoenix/frontend-javascript)
* [Local Environment Variables](/elixir/phoenix/local-evars)
* [Back to Phoenix overview](/elixir/phoenix)
