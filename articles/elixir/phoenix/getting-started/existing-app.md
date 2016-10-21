# Existing Phoenix App
Part of what makes nanobox so useful is you don't have to have elixir or phoenix installed on your local machine. This guide will help you get an existing Phoenix app up-and-running with nanobox.

## Build a Elixir Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a phoenix console, or even rake tasks as you would normally.

#### Add a boxfile.yml
The boxfile.yml tells nanobox how to build and configure these environments. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# tell nanobox to build a elixir runtime
code.build:
  engine: elixir
```

#### Build the Environment

```bash
# build a elixir runtime
nanobox build

# deploy the elixir runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add phoenix.nanobox.dev
```

## Configure your Phoenix App
WIP

## Phoenix up-and-running
WIP

Visit the app from your favorite browser at: `phoenix.nanobox.dev`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](/elixir/phoenix/next-steps/add-a-database)
* [Javascript Runtime](/elixir/phoenix/next-steps/javascript-runtime)
* [Local Environment Variables](/elixir/phoenix/next-steps/local-evars)
* [Back to Phoenix overview](/elixir/phoenix)
