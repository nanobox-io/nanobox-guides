# Existing Hugo App
Part of what makes nanobox so useful is you don't have to have golang or hugo installed on your local machine.

This guide will help you get an existing Hugo app up-and-running with nanobox.

## Build a Ruby Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a hugo console, or even rake tasks as you would normally.

#### Add a boxfile.yml
The boxfile.yml tells nanobox how to build and configure these environments. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# tell nanobox to build a golang runtime. We also need to tell nanobox
# where our package is located.
code.build:
  engine: golang
  config:
    package: nanobox-hugo
```

#### Build the Environment

```bash
# build a golang runtime
nanobox build

# deploy the golang runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add hugo.nanobox.dev
```

## Configure your Hugo App
As of the writing of this guide, Hugo does not have a way to pre-configure your application to bind to the correct host or port. We'll take care of that below when [starting the server](#hugo-up-and-running).

## Hugo up-and-running
With the app configured the last thing to do is run it:

```bash
# run the app from the nanobox dev console
hugo server --baseUrl=hugo.nanobox.dev --bind=0.0.0.0 --port=8080
```

Visit the app from your favorite browser at: `hugo.nanobox.dev`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](/golang/hugo/connect-a-database)
* [Javascript Runtime](/golang/hugo/javascript-runtime)
* [Local Environment Variables](/golang/hugo/local-evars)
* [Back to hugo overview](/golang/hugo)
