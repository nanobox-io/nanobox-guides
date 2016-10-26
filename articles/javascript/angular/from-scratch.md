# Angular from Scratch
When using nanobox with angular, keep in mind that the angular will communicate with an API that could be built in any language.

Nanobox can be used for quickly testing angular in isolation, however, think about the backend that your angular app will be communicating with and reference those guides to run your backend server with nanobox.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-angular" target="\_blank">nanobox-angular</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Node Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a angular console, or even rake tasks as you would normally.

Decide where you want your project to live and create a folder there:

```bash
# create a project folder
mkdir nanobox-angular
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
nanobox dev dns add angular.nanobox.dev
```

## Create an Angular App
Angular requires some initial configuration before being able to create the application. Follow the steps outlined <a href="https://angular.io/docs/ts/latest/quickstart.html#!#add-config-files" target="\_blank">here</a> to create the necessary configuration files before continuing.

Once you've got all the configuration in place we need to get a development environment running:

```bash
# console into the dev environment
nanobox dev console

# install angular and all it's dependencies
npm install
```

**NOTE:** Ensure your project now has a `typings` folder. If it does not, you can try and manually create it with the following command:

```bash
# from the nanobox console
npm run typings install
```

With the application configured; due to the complexity of setting up a simple Angular application it is recommended that you <a href="https://angular.io/docs/ts/latest/quickstart.html#!#ngmodule" target="\_blank">follow their guide</a> steps 2 - 5. Once complete return here to get your app running with nanobox.

**NOTE:** We've also created a <a href="https://github.com/nanobox-quickstarts/nanobox-angularjs" target="\_blank">nanobox-angularjs</a> quickstart that was created following their guide which can be used to quickly launch an Angular app with nanobox.

#### Make App Accessible
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
