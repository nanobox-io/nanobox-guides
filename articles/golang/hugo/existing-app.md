# Existing Hugo App
Part of what makes nanobox so useful is you don't even need golang or hugo installed on your local machine to use them.

This guide will help you get an existing Hugo app up-and-running with nanobox.

## Build a Golang Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *go get* or *go build*.

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: golang
  config:
    package: nanobox-hugo
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Configure your Hugo App
As of the writing of this guide, Hugo does not have a way to pre-configure your application to bind to the correct host or port. We'll take care of that below when [starting the server](#hugo-up-and-running).

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add hugo.nanobox.dev
```

## Hugo up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
hugo server --baseUrl=hugo.nanobox.dev --bind=0.0.0.0 --port=8080
```

Once the app has started you can visit it from your favorite browser at `hugo.nanobox.dev:8080`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/golang/hugo//add-a-database)
* [Javascript Runtime](/golang/hugo//javascript-runtime)
* [Local Environment Variables](/golang/hugo//local-evars)
* [Back to Hugo overview](/golang/hugo)
