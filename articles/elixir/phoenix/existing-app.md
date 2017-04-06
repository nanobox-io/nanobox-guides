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

# add postgres as a data component
data.db:
  image: nanobox/postgresql
```

## Configure Phoenix

#### Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local phoenix.dev
```

#### Configure the database
**HEADS UP**: You can find more information about [adding and configuring a database](/elixir/phoenix/add-a-database) but here's the quick and dirty:

```elixir
# Configure your database
config :phoenix_crud, PhoenixCrud.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DATA_DB_USER"),
  password: System.get_env("DATA_DB_PASS"),
  hostname: System.get_env("DATA_DB_HOST"),
  database: "app_dev",
  pool_size: 10
```

## Run the app

```
nanobox run mix phoenix.server
```

Visit your app at <a href="http://phoenix.dev:4000" target="\_blank">phoenix.dev:4000</a>

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
