# Existing Elixir App
Part of what makes Nanobox so useful is you don't even need Elixir installed on your local machine to use it.

## Setup

#### cd into your Elixir app
Change into an existing project folder:

```bash
cd your-elixir-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Elixir <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: elixir
```

## Configure App

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0).

#### Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local elixir.dev
```

## Run the app
To run the app and drop into an interactive iex session:

```bash
nanobox run iex -S mix
```

Visit your app at <a href="http://elixir.dev>" target="\_blank">elixir.dev</a>

## Explore
With Nanobox, you have everything you need develop and run your Elixir app:

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

* [Add a Database](/elixir/generic/add-a-database)
* [Frontend Javascript](/elixir/generic/frontend-javascript)
* [Local Environment Variables](/elixir/generic/local-evars)
* [Back to Elixir overview](/elixir/generic)
