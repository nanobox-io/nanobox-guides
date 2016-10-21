# Phoenix from Scratch
Part of what makes nanobox so useful is you don't have to have elixir or phoenix installed on your local machine.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-phoenix" target="\_blank">nanobox-phoenix</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Elixir Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a phoenix console, or even rake tasks as you would normally.

Decide where you want your project to live and create a folder there:

```bash
# create a project folder
mkdir nanobox-phoenix
```

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

## Create a Phoenix App
WIP

#### Make App Accessible
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
