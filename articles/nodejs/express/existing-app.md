# Existing Express App
Part of what makes nanobox so useful is you don't even need nodejs or express installed on your local machine to use them.

This guide will help you get an existing Express app up-and-running with nanobox.

*If you don't have an existing Express project, the [Express form Scratch guide](/php/express/from-scratch) is where you should start.*

## Create a Nodejs Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *npm install* or *npm start*.

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

## Configure Express
To allow connections from the host machine into the app's container modify the `bin/www` telling express to listen on all available IP's at port 8080:

```javascript
var port = normalizePort(process.env.PORT || '8080');
app.set('port', port);
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add express.nanobox.dev
```

## Express up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
npm start
```

Once the app has started you can visit it from your favorite browser at `express.nanobox.dev`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/nodejs/express/add-a-database)
* [Javascript Runtime](/nodejs/express/javascript-runtime)
* [Local Environment Variables](/nodejs/express/local-evars)
* [Back to Express overview](/nodejs/express)
