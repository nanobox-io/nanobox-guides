# Express: Getting Started

This guide will walk you through getting a simple Express.js app up and running on nanobox. This guide was used in the creation of the [nanobox-expressjs](https://github.com/nanobox-quickstarts/nanobox-expressjs) app found under [nanobox-quickstarts](https://github.com/nanobox-quickstarts) on github.

## Setup Your Project

If you don't have an existing project, create a new project directory.

```bash
mkdir nanobox-expressjs
```

Create a `boxfile.yml` at the root of your project that contains the following. Because we're using Express.js, we need to tell Nanobox we need a Node.js environment.

```yaml
code.build:
  # tells nanobox to install node.js and associated executables
  engine: nodejs
```

## Create Your Dev Environment
With your boxfile.yml in place, you're ready setup your dev environment. From the project directory run the following commands:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# add a convenient way to access your app from the browser
nanobox dev dns add expressjs.nanobox.dev

# console into the dev environment
nanobox dev console
```

## Install & Configure Express
If you're working with a brand new project directory with nothing in it, you'll need to install Express and Express Generator. If you already have an Express codebase, you can skip to [Listen on Port 8080](#listen-on-port-8080).

```bash
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

### Listen on Port 8080
Nanobox requires apps to listen on `0.0.0.0:8080`. In `bin/www`, set the default port to be `8080`:

```js
/**
 * Get port from environment and store in Express.
 */

var port = normalizePort(process.env.PORT || '8080');
app.set('port', port);
```

## Start Your App
Now you're ready to run Express. Inside your dev console, just run:

```bash
npm start
```

Your Express app can be accessed in your browser of choice at `expressjs.nanobox.io:8080`.

## Now What?
Now that you have Express running on Nanobox, what's next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* Connecting to a database
* Adding components
* Preparing for production
* Launching your app
