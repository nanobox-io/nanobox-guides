# Ember from Scratch
When using nanobox with ember, keep in mind that the ember will communicate with an API that could be built in any language.

Nanobox can be used for quickly testing ember in isolation, however, think about the backend that your ember app will be communicating with and reference those guides to run your backend server with nanobox.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-ember" target="\_blank">nanobox-ember</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Create a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *npm install* and *ember server*.

#### Create a Ember project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-ember
```

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
run.config:
  engine: nodejs
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Create a Ember App
Once the dev environment is started you can console into it and create a new ember application:

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

#### Configure Ember
To allow connections from the host machine into the app's container modify the `.ember-cli` telling ember to listen on all available IP's at port 8080:

```javascript
{
  "host" : "0.0.0.0",
  "port" : 8080
}
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add ember.nanobox.dev
```

## Ember up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
ember server
```

Once the app has started you can visit it from your favorite browser at `ember.nanobox.dev`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/javascript/ember/add-a-database)
* [Javascript Runtime](/javascript/ember/javascript-runtime)
* [Local Environment Variables](/javascript/ember/local-evars)
* [Back to Ember overview](/javascript/ember)
