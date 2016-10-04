# Sails: Getting Started
This guide will walk you through getting a simple Sails app up and running with nanobox. This guide was used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-sailsjs" target="\_blank">nanobox-sailsjs</a> app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

The guide is broken down into three sections:

1. Project Setup
2. Application Config
3. Up and Running

## Project Setup
If you already have a project you'd like to use with nanobox simply [add a boxfile.yml](#add-a-boxfile-yml) and continue with this guide, otherwise you'll need to follow the next steps to create a new project.

#### Create a project
Decide where you want your project to live and create a folder there

```bash
mkdir nanobox-sails
```

#### Add a boxfile.yml
Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
code.build:

  # because we're using sails we need to tell nanobox that we need nodejs in our container
  engine: "nodejs"
```

## Application Config
If you already have an application you'd like to run with nanobox you'll simply need to [make it accessible to the host](#make-it-accessible), otherwise follow the steps below to create an application.

#### Create an Application
Part of what makes nanobox so useful is you don't have to have sails, or nodejs installed on your local machine to utilize them. We're going to create a development environment in which you will generate your sails application.

First we need to get a development environment running:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

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

#### Make it Accessible
Most frameworks by default will bind to localhost, however we need to allow connections from the host into your container. To do this we need to tell sails to bind to all available IP's

In your applications `config/env/development.js` add the following:

```javascript
host: '0.0.0.0',
port: '8080'
```

## Up and Running
With the application configured the last thing to do is run it with nanobox. From the project directory run the following commands:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# add a convenient way to access your app from the browser
nanobox dev dns add sails.nanobox.dev

# console into the dev environment
nanobox dev console

# run the app
sails lift
```

Visit the app from your favorite browser at `sails.nanobox.dev:8080`

## Now what?
Now that you have an application running with nanobox whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* Connecting to a database
* Adding components
* Preparing for production
* Launching your app
