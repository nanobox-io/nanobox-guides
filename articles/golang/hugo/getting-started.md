# Hugo: Getting Started
This guide will walk you through getting a simple Hugo app up and running with nanobox. This guide was used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-hugo" target="\_blank">nanobox-hugo</a> app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

The guide is broken down into three sections:

1. Project Setup
2. Application Config
3. Up and Running

## Project Setup
If you already have a project you'd like to use with nanobox simply [add a boxfile.yml](#add-a-boxfile-yml) and continue with this guide, otherwise you'll need to follow the next steps to create a new project.

#### Create a project
Decide where you want your project to live and create a folder there

```bash
mkdir nanobox-hugo
```

#### Add a boxfile.yml
Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
code.build:

  # because we're using hugo we need to tell nanobox that we need nodejs in our container
  engine: "golang"

  # we need to tell go where our package is located; since we want to use this projects codebase we specify "."
  config:
    package: "nanobox-beego"
```

## Application Config
If you already have an application you'd like to run with nanobox you'll simply need to [make it accessible to the host](#make-it-accessible), otherwise follow the steps below to create an application.

#### Create an Application
Part of what makes nanobox so useful is you don't have to have hugo installed on your local machine to utilize it. We're going to create a development environment in which you will generate your hugo application.

First we need to get a development environment running:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# console into the dev environment
nanobox dev console

# install hugo so we can use it to generate our application
go get -v github.com/spf13/hugo

# generate our new hugo application; due to a limitation in hugo we'll have to generate our app in another folder and move it where we want it

# cd into the /tmp dir to create an app
cd /tmp

# generate the hugo app
hugo new site app

# cd back into the /app dir
cd -

# copy the generated app into the project
cp -a /tmp/app/* .
```

With the base application generated we'll want to add a theme to our app so we have something to look at. From inside the nanobox console run the following:

```bash

# cd into the themes directory
cd themes

# clone a theme
git clone https://github.com/allnightgrocery/hugo-theme-blueberry-detox.git
```

With a theme downloaded, replace the contents of the `config.toml` file with the following:

```toml
title = "Hello nanobox!"
languageCode = "en-us"
theme = "hugo-theme-blueberry-detox"
```

#### Make it Accessible
Most frameworks by default will bind to localhost, however we need to allow connections from the host into your container. To do this we need to tell hugo to bind to all available IP's

As of the writing of this guide, Hugo does not have a way to pre-configure your application to bind to the correct host or port. We'll take care of that below when [starting the server](#up-and-running).

## Up and Running
With the application configured the last thing to do is run it with nanobox. From the project directory run the following commands:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# add a convenient way to access your app from the browser
nanobox dev dns add hugo.nanobox.dev

# console into the dev environment
nanobox dev console

# run the app
hugo server --baseUrl=hugo.nanobox.dev --bind=0.0.0.0 --port=8080
```

Visit the app from your favorite browser at `hugo.nanobox.dev:8080`

## Now what?
Now that you have an application running with nanobox whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* Connecting to a database
* Adding components
* Preparing for production
* Launching your app
