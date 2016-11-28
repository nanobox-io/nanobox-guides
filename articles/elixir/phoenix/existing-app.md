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

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Elixir <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: elixir
```

## Configure Phoenix

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0) by modifying the ...:

#### Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local phoenix.dev
```

## Run the app
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/elixir/phoenix/add-a-database) before your app will run.

```bash
WIP
```

Visit your app at <a href="http://phoenix.dev:3000" target="\_blank">phoenix.dev:3000</a>

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
