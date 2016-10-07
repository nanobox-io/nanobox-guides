# Beego: Getting Started
This guide will walk you through getting a simple Beego app up and running with nanobox. This guide was used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-beego" target="\_blank">nanobox-beego</a> app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

The guide is broken down into three sections:

1. Project Setup
2. Application Config
3. Up and Running

## Project Setup
If you already have a project you'd like to use with nanobox simply [add a boxfile.yml](#add-a-boxfile-yml) and continue with this guide, otherwise you'll need to follow the next steps to create a new project.

#### Create a project
Decide where you want your project to live and create a folder there

```bash
mkdir nanobox-beego
```

#### Add a boxfile.yml
Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# because we're using beego we need to tell nanobox that we need nodejs in our
# container. We also need to tell go where our package is located; since we want
# to use this projects codebase we specify "nanobox-beego"
code.build:
  engine: "golang"
  config:
    package: "nanobox-beego"
```

## Application Config
If you already have an application you'd like to run with nanobox you'll simply need to [make it accessible to the host](#make-it-accessible), otherwise follow the steps below to create an application.

#### Create an Application
Part of what makes nanobox so useful is you don't have to have beego installed on your local machine to utilize it. We're going to create a development environment in which you will generate your beego application.

First we need to get a development environment running:

```bash
# build a golang runtime
nanobox build

# deploy the golang runtime into the dev environment
nanobox dev deploy

# console into the dev environment
nanobox dev console

# install beego so we can use it to generate our application
go get github.com/astaxie/beego
go get github.com/beego/bee

# generate the beego app
beego new .
```

#### Make it Accessible
Most frameworks by default will bind to localhost, however we need to allow connections from the host into your container. To do this we need to tell beego to bind to all available IP's

In your applications `conf/app.conf` add the following:

```conf
httpaddr = "0.0.0.0"
httpport = 8080
```

## Up and Running
With the application configured the last thing to do is run it with nanobox. From the project directory run the following commands:

```bash
# build a golang runtime
nanobox build

# deploy the golang runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add beego.nanobox.dev

# console into the dev environment
nanobox dev console

# run the app
beego run
```

Visit the app from your favorite browser at `beego.nanobox.dev:8080`

## Now what?
Now that you have an application running with nanobox whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](connect-a-database.html)
* [Prepare for production](prepare-for-production.html)
* [Launch your app](launch-your-app.html)
* [Back to rails overview](overview.html)
