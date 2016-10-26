# Existing Angular App
When using nanobox with angular, keep in mind that the angular will communicate with an API that could be built in any language.

Nanobox can be used for quickly testing angular in isolation, however, think about the backend that your angular app will be communicating with and reference those guides to run your backend server with nanobox.

## Build a Node Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a angular console, or even rake tasks as you would normally.

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
nanobox dev dns add angular.nanobox.dev
```

## Configure your Angular App
We need to allow connections from the host into the app's container. To do this we need modify the `bs-config.json` telling angular to listen on all available IP's at port 8080:

```javascript
{
  "host": "0.0.0.0",
  "port": 8080
}
```

## Angular up-and-running
With the app configured the last thing to do is run it:

```bash
# run the app from the nanobox dev console
npm start
```

Visit the app from your favorite browser at: `angular.nanobox.dev`
