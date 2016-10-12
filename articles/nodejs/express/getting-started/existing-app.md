# Starting with an Existing Express App

Part of what makes nanobox so useful is you don't have to have Node.js or Express installed on your local machine. This guide walks through getting an existing Express app up and running with Nanobox.

*If you don't have an existing Express project, the [Express form Scratch guide](/php/express/getting-started/from-scratch) is where you should start.*

## Build a Node Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a ember console, or even rake tasks as you would normally.

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

## Configure Express
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
# console into the dev environment
nanobox dev console

# start express
npm start
```

Your Express app can be accessed in your browser of choice at `expressjs.nanobox.io:8080`.

## Now What?
Now that you have Express running on Nanobox, what's next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a database](/nodejs/express/next-steps/add-a-database)
* [Local Environment Variables](/nodejs/express/next-steps/local-evars)
* [Configure Express](/nodejs/express/production/configure-express)
