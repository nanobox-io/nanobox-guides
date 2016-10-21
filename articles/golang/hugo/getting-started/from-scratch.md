# Hugo from Scratch
Part of what makes nanobox so useful is you don't have to have golang or hugo installed on your local machine.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-hugo" target="\_blank">nanobox-hugo</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a hugo console, or even rake tasks as you would normally.

Decide where you want your project to live and create a folder there:

```bash
# create a project folder
mkdir nanobox-hugo
```

#### Add a boxfile.yml
The boxfile.yml tells nanobox how to build and configure these environments. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# tell nanobox to build a golang runtime. We also need to tell nanobox
# where our package is located.
code.build:
  engine: golang
  config:
    package: nanobox-hugo
```

#### Build the Environment

```bash
# build a golang runtime
nanobox build

# deploy the golang runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add hugo.nanobox.dev
```

## Create a Hugo App

```bash
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

#### Make App Accessible
As of the writing of this guide, Hugo does not have a way to pre-configure your application to bind to the correct host or port. We'll take care of that below when [starting the server](#hugo-up-and-running).

## Hugo up-and-running
With the app configured the last thing to do is run it:

```bash
# run the app from the nanobox dev console
hugo s
```

Visit the app from your favorite browser at: `hugo.nanobox.dev`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](/golang/hugo/connect-a-database)
* [Javascript Runtime](/golang/hugo/javascript-runtime)
* [Local Environment Variables](/golang/hugo/local-evars)
* [Back to Hugo overview](/golang/hugo)
