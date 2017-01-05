# Gin from Scratch
Part of what makes nanobox so useful is you don't even need golang or gin installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-gin" target="\_blank">nanobox-gin</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like `go get` or `go build`.

#### Create a Gin project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-gin
```

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: golang
  config:
    package: nanobox-gin
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Create a Gin App
Once the dev environment is started you can console into it and create a new gin application:

```bash
# console into the dev environment
nanobox dev console

# install gin so we can use it to generate our application
go get github.com/astaxie/gin
go get github.com/gin/bee

# generate the gin app
gin new .
```

#### Configure your Gin app
To allow connections from the host machine into the app's container modify the `conf/app.conf` telling gin to listen on all available IP's at port 8080:

```conf
httpaddr = "0.0.0.0"
httpport = 8080
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add gin.nanobox.dev
```

## Gin up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
gin run
```

Once the app has started you can visit it from your favorite browser at `gin.nanobox.dev:8080`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/golang/gin/next-steps/add-a-database)
* [Javascript Runtime](/golang/gin/next-steps/javascript-runtime)
* [Local Environment Variables](/golang/gin/next-steps/local-evars)
* [Back to Gin overview](/golang/gin)
