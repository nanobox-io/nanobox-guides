# Angular: Getting Started
This guide will walk you through getting a simple Angular app up and running with nanobox. This guide was used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-angularjs" target="\_blank">nanobox-angularjs</a> app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

The guide is broken down into three sections:

1. Project Setup
2. Application Config
3. Up and Running

## Project Setup
If you already have a project you'd like to run with nanobox simply [add a boxfile.yml](#add-a-boxfile-yml) and continue with this guide, otherwise you'll need to follow the next steps to create a new project.

#### Create a project
Decide where you want your project to live and create a folder there

```bash
mkdir nanobox-angular
```

#### Add a boxfile.yml
Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# because we're using angular we need to tell nanobox that we need nodejs in
# our container
code.build:
  engine: "nodejs"
```

## Application Config
If you already have an application you'd like to run with nanobox you'll simply need to [make it accessible to the host](#make-it-accessible), otherwise follow the steps below to create an application.

#### Create an Application
Part of what makes nanobox so useful is you don't have to have angular, or nodejs installed on your local machine to utilize them. We're going to create a development environment in which you will generate your angular application.

Angular requires some initial configuration before being able to create the application. Follow the steps outlined <a href="https://angular.io/docs/ts/latest/quickstart.html#!#add-config-files" target="\_blank">here</a> to create the necessary configuration files before continuing.

Once you've got all the configuration in place we need to get a development environment running:

```bash
# build a nodejs runtime
nanobox build

# deploy the nodejs runtime into the dev environment
nanobox dev deploy

# console into the dev environment
nanobox dev console

# install angular and all it's dependencies
npm install
```

**NOTE:** Ensure your project now has a `typings` folder. If it does not, you can try and manually create it with the following command:

```bash
npm run typings install
```

With the application configured; due to the complexity of setting up a simple Angular application it is recommended that you follow their guide steps 2 - 5. Once complete return here to get your app running with nanobox.

**NOTE:** We've also created a <a href="https://github.com/nanobox-quickstarts/nanobox-angularjs" target="\_blank">nanobox-angularjs</a> quickstart that was created following their guide which can be used to quickly launch an Angular app with nanobox.

#### Make it Accessible
Most frameworks by default will bind to localhost, however we need to allow connections from the host into your container. To do this we need to tell angular to bind to all available IP's

In your applications `bs-config.json` add the following (create this file at the project root if you don't already have one):

```javascript
{
  "host": "0.0.0.0",
  "port": 8080
}
```

## Up and Running
With the application configured the last thing to do is run it on nanobox. From the project directory run the following commands:

```bash
# build a nodejs runtime
nanobox build

# deploy the nodejs runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add angular.nanobox.dev

# console into the dev environment
nanobox dev console

# run the app
npm start
```

Visit the app from your favorite browser at `angular.nanobox.dev:8080`

## Now what?
Now that you have an application running with nanobox whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](connect-a-database.html)
* [Prepare for production](prepare-for-production.html)
* [Launch your app](launch-your-app.html)
* [Back to rails overview](overview.html)
