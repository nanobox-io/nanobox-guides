# Express from Scratch

Part of what makes nanobox so useful is you don't have to have Node.js or Express installed on your local machine. This guide walks through getting an Express app up and running from scratch with Nanobox.

The process outline in this guide is the same used to create the [nanobox-expressjs](https://github.com/nanobox-quickstarts/nanobox-expressjs) quicksrat found under [nanobox-quickstarts](https://github.com/nanobox-quickstarts) on Github.

*If you have an existing Express project, the [Existing Express App guide](/php/express/getting-started/existing-app) is where you should start.*

## Build a Node Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a ember console, or even rake tasks as you would normally.

Create new project directory and cd into it.

```bash
# create a new project directory
mkdir nanobox-expressjs

# cd into your new project directory
```

### Add a boxfile.yml
The boxfile.yml tells nanobox how to build and configure these environments. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
code.build:
  # tells nanobox to install node.js and associated executables
  engine: nodejs
```

### Build the Environment
With your boxfile.yml in place, you're ready setup your dev environment. From the project directory run the following commands:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# add a convenient way to access your app from the browser
nanobox dev dns add expressjs.nanobox.dev
```

## Install & Configure Express
Now that your dev environment is running, you can console into and create a new Express project.

```bash
# console into your dev environment
nanobox dev console

# install express.js and save to package.json
npm install express --save

# install the express generator
npm install express-generator -g

# build an express skeleton
express

# Answer 'y' when notified the destination is not empty

# install express npm packages
npm install
```

## Configure Express
Nanobox requires apps to listen on `0.0.0.0:8080`. In `bin/www`, set the default port to be `8080`:

```js
/**
 * Get port from environment and store in Express.
 */

var port = normalizePort(process.env.PORT || '8080');
app.set('port', port);
```

## Start Express
Now you're ready to run Express. Inside your dev console, just run:

```bash
# start express from your dev console
npm start
```

Your Express app can be accessed in your browser of choice at `expressjs.nanobox.io:8080`.

## Now What?
Now that you have Express running on Nanobox, what's next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a database](/nodejs/express/next-steps/add-a-database)
* [Local Environment Variables](/nodejs/express/next-steps/local-evars)
* [Configure Express](/nodejs/express/production/configure-express)
