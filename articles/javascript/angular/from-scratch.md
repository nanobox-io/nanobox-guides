# Angular from Scratch
When using nanobox with angular, keep in mind that the angular will communicate with an API that could be built in any language.

Nanobox can be used for quickly testing angular in isolation, however, think about the backend that your angular app will be communicating with and reference those guides to run your backend server with nanobox.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-angular" target="\_blank">nanobox-angular</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Create a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *npm install* and *npm start*.

#### Create a Angular project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-angular
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

## Create a Angular App
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

#### Configure Angular
To allow connections from the host machine into the app's container modify the `bs-config.json` telling angular to listen on all available IP's at port 8080:

```javascript
{
  "host": "0.0.0.0",
  "port": 8080
}
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add angular.nanobox.dev
```

## Angular up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
npm start
```

Once the app has started you can visit it from your favorite browser at `angular.nanobox.dev`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/javascript/angular/add-a-database)
* [Javascript Runtime](/javascript/angular/javascript-runtime)
* [Local Environment Variables](/javascript/angular/local-evars)
* [Back to Angular overview](/javascript/angular)