# Sails from Scratch
Part of what makes nanobox so useful is you don't even need nodejs or sails installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-sails" target="\_blank">nanobox-sails</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Nodejs Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *npm install* or *sails lift*

#### Create a Sails project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-sails
```

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: nodejs
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Create a Sails App
Once the dev environment is started you can console into it and create a new sails application:

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

#### Configure Sails
To allow connections from the host machine into the app's container modify the `config/env/development.js` telling sails to listen on all available IP's at port 8080:

```javascript
host: '0.0.0.0',
port: '8080'
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add sails.nanobox.dev
```

## Sails up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
sails lift
```

Once the app has started you can visit it from your favorite browser at `sails.nanobox.dev`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/nodejs/sails/add-a-database)
* [Javascript Runtime](/nodejs/sails/javascript-runtime)
* [Local Environment Variables](/nodejs/sails/local-evars)
* [Back to Sails overview](/nodejs/sails)
