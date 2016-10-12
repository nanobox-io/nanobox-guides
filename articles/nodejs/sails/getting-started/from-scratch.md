# Sails from Scratch
Part of what makes nanobox so useful is you don't have to have nodejs or sails installed on your local machine.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-sails" target="\_blank">nanobox-sails</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a sails console, or even rake tasks as you would normally.

Decide where you want your project to live and create a folder there:

```bash
# create a project folder
mkdir nanobox-sails
```

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

## Create a Sails App

```bash
# console into the dev environment
nanobox dev console

# install sails so we can use it to generate our application
npm install -g sails

# generate our new sails application; due to a limitation in sails we'll have to generate our app in another folder and move it where we want it

# cd into the /tmp dir to create an app
cd /tmp

# generate the sails app
sails new app

# cd back into the /app dir
cd -

# copy the generated app into the project
cp -a /tmp/app/* .
```

#### Make App Accessible
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

Visit the app from your favorite browser at: `sails.nanobox.dev:8080`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](connect-a-database.html)
* [Javascript Runtime](javascript-runtime.html)
* [Local Environment Variables](local-evars.html)
* [Back to sails overview](sails.html)
