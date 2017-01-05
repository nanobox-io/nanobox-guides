# Revel from Scratch
Part of what makes nanobox so useful is you don't even need golang or revel installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-revel" target="\_blank">nanobox-revel</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like `go get` or `go build`.

#### Create a Revel project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-revel
```

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: golang
  config:
    package: nanobox-revel
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Create a Revel App
Once the dev environment is started you can console into it and create a new revel application:

```bash
# console into the dev environment
nanobox dev console

# install revel so we can use it to generate our application
go get github.com/astaxie/revel
go get github.com/revel/bee

# generate the revel app
revel new .
```

#### Configure your Revel app
To allow connections from the host machine into the app's container modify the `conf/app.conf` telling revel to listen on all available IP's at port 8080:

```conf
httpaddr = "0.0.0.0"
httpport = 8080
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add revel.nanobox.dev
```

## Revel up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
revel run
```

Once the app has started you can visit it from your favorite browser at `revel.nanobox.dev:8080`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/golang/revel/next-steps/add-a-database)
* [Javascript Runtime](/golang/revel/next-steps/javascript-runtime)
* [Local Environment Variables](/golang/revel/next-steps/local-evars)
* [Back to Revel overview](/golang/revel)
