# Iris from Scratch
Part of what makes nanobox so useful is you don't even need golang or iris installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-iris" target="\_blank">nanobox-iris</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like `go get` or `go build`.

#### Create a Iris project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-iris
```

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: golang
  config:
    package: nanobox-iris
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Create a Iris App
Once the dev environment is started you can console into it and create a new iris application:

```bash
# console into the dev environment
nanobox dev console

# install iris so we can use it to generate our application
go get github.com/astaxie/iris
go get github.com/iris/bee

# generate the iris app
iris new .
```

#### Configure your Iris app
To allow connections from the host machine into the app's container modify the `conf/app.conf` telling iris to listen on all available IP's at port 8080:

```conf
httpaddr = "0.0.0.0"
httpport = 8080
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add iris.nanobox.dev
```

## Iris up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
iris run
```

Once the app has started you can visit it from your favorite browser at `iris.nanobox.dev:8080`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/golang/iris/next-steps/add-a-database)
* [Javascript Runtime](/golang/iris/next-steps/javascript-runtime)
* [Local Environment Variables](/golang/iris/next-steps/local-evars)
* [Back to Iris overview](/golang/iris)
