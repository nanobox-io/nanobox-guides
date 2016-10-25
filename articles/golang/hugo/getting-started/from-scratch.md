# Hugo from Scratch
Part of what makes nanobox so useful is you don't even need golang or hugo installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-hugo" target="\_blank">nanobox-hugo</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *go get* or *go build*.

#### Create a Hugo project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-hugo
```

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: golang
  config:
    package: nanobox-hugo
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Create a Hugo App
Once the dev environment is started you can console into it and create a new hugo application:

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

#### Configure your Hugo app
As of the writing of this guide, Hugo does not have a way to pre-configure your application to bind to the correct host or port. We'll take care of that below when [starting the server](#hugo-up-and-running).

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add hugo.nanobox.dev
```

## Hugo up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
hugo run
```

Once the app has started you can visit it from your favorite browser at `hugo.nanobox.dev:8080`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/golang/hugo/next-steps/add-a-database)
* [Javascript Runtime](/golang/hugo/next-steps/javascript-runtime)
* [Local Environment Variables](/golang/hugo/next-steps/local-evars)
* [Back to Hugo overview](/golang/hugo)
