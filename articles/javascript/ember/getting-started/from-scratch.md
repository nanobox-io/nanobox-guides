# Ember from Scratch
**When using nanobox with ember, keep in mind that the ember will communicate with an API that could be built in any language. Nanobox can be used for quickly testing ember in isolation, however, think about the backend that your ember app will be communicating with and reference those guides to run your backend server with nanobox.**

Part of what makes nanobox so useful is you don't have to have nodejs or ember installed on your local machine.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-ember" target="\_blank">nanobox-ember</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Node Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a ember console, or even rake tasks as you would normally.

Decide where you want your project to live and create a folder there:

```bash
# create a project folder
mkdir nanobox-ember
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
nanobox dev dns add ember.nanobox.dev
```

## Create an Ember App

```bash
# console into the dev environment
nanobox dev console

# install ember so we can use it to generate our application
npm install -g ember-cli

# generate our new ember application; due to a limitation in ember we'll have to generate our app in another folder and move it where we want it

# cd into the /tmp dir to create an app
cd /tmp

# generate the ember app
ember new tmp-app

# cd back into the /app dir
cd -

# copy the generated app into the project
cp -a /tmp/tmp-app/* .
```

#### Make App Accessible
We need to allow connections from the host into the app's container. To do this we need modify the `.ember-cli` telling ember to listen on all available IP's at port 8080:

```javascript
{
  "host" : "0.0.0.0",
  "port" : 8080
}
```

## Ember up-and-running
With the app configured the last thing to do is run it:

```bash
# run the app from the nanobox dev console
ember server
```

Visit the app from your favorite browser at: `ember.nanobox.dev:8080`
