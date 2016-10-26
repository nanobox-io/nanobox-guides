# Phoenix from Scratch
Part of what makes nanobox so useful is you don't even need elixir or phoenix installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-phoenix" target="\_blank">nanobox-phoenix</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build an Elixir Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *mix*.

#### Create a Phoenix project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-phoenix
```

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the elixir <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: elixir
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Create a Phoenix App
WIP

#### Configure Phoenix
WIP

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add phoenix.nanobox.dev
```

## Phoenix up-and-running
WIP

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/elixir/phoenix/add-a-database)
* [Javascript Runtime](/elixir/phoenix/javascript-runtime)
* [Local Environment Variables](/elixir/phoenix/local-evars)
* [Back to Phoenix overview](/elixir/phoenix)
