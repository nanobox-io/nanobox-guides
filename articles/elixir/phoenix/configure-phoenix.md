# Configure Phoenix for Production

## Port configuration
Your app's router will handle http and SSL/TLS encryption, and then forward the connection to your app at port 8080.

Let's ensure the production app is listening on port 8080:

```elixir
config :phoenix_crud, PhoenixCrud.Endpoint,
  http: [port: 8080],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json"
```

## Add a web component
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/boxfile/web/).

The Elixir engine provides a `node-start` helper script that ensures all nodes in an Elixir cluster have the necessary credentials to communicate with each other. You should always prefix your web component's start command with `node-start`.

```yaml
web.main:
  start: node-start mix phoenix.server
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

## Compile Assets
We can have phoenix generate the static assets during the deploy by adding an extra step:

```yaml
deploy.config:
  # generate the static assets digest
  extra_steps:
    - mix phoenix.digest
```

## Migrate Data
To migrate data as part of the deploy process you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  # just before the new process comes online,
  # let's migrate the database
  before_live:
    web.main:
      - mix ecto.create --quiet
      - mix ecto.migrate
```

## Review

Your final `boxfile.yml` might look something like this:

```yaml
run.config:
  # elixir runtime
  engine: elixir

  # we need nodejs in development
  # ensure inotify exists for hot-code reloading
  dev_packages:
    - nodejs
    - inotify-tools

  # cache node_modules
  cache_dirs:
    - node_modules

  # add node_module bins to the $PATH
  extra_path_dirs:
    - node_modules/.bin

  # enable the filesystem watcher
  fs_watch: true

deploy.config:
  # generate the static assets digest
  extra_steps:
    - mix phoenix.digest

  # just before the new process comes online,
  # let's migrate the database
  before_live:
    web.main:
      - mix ecto.create --quiet
      - mix ecto.migrate

# services

# add postgres as a data component
data.db:
  image: nanobox/postgresql

web.main:
  start: node-start mix phoenix.server
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/elixir/phoenix/preview-your-app)
* [Launch your App](/elixir/phoenix/launch-your-app)
* [Back to Phoenix overview](/elixir/phoenix)
