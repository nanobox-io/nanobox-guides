# Existing Sails App
Part of what makes nanobox so useful is you don't have to have nodejs or sails installed on your local machine.

This guide will help you get an existing Sails app up-and-running with nanobox.

## Build a Ruby Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a sails console, or even rake tasks as you would normally.

#### Add a boxfile.yml
The boxfile.yml tells nanobox how to build and configure these environments. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# tell nanobox to build a nodejs runtime
code.build:
  engine: nodejs
```

#### Build the Environment

```bash
# build a nodejs runtime
nanobox build

# deploy the nodejs runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add sails.nanobox.dev
```

## Configure your Sails App
We need to allow connections from the host into the app's container. To do this we need modify the `config/env/development.js` telling sails to listen on all available IP's at port 8080:

```javascript
host: '0.0.0.0',
port: '8080'
```

## Sails up-and-running
With the app configured the last thing to do is run it:

```bash
# run the app from the nanobox dev console
sails lift
```

Visit the app from your favorite browser at: `sails.nanobox.dev`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](/nodejs/sails/connect-a-database)
* [Javascript Runtime](/nodejs/sails/javascript-runtime)
* [Local Environment Variables](/nodejs/sails/local-evars)
* [Back to Sails overview](/nodejs/sails)
