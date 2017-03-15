# Existing Iris App
Part of what makes Nanobox so useful is you don't even need Golang or Iris installed on your local machine to use them.

## Setup

#### cd into your Iris app
Change into an existing project folder:

```bash
cd my-iris-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: golang
  engine.config:
    package: nanobox-iris
```

## Configure Iris

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, your app needs to listen on all available IP's (0.0.0.0). Iris does this by default, and so no additional configuration is needed.

#### Add local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local iris.dev
```

## Run the app
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/golang/iris/add-a-database) before your app will run.

```bash
nanobox run go run main.go
```

Visit your app at <a href="http://iris.dev:8080" target="\_blank">iris.dev:8080</a>

## Explore
With Nanobox, you have everything you need develop and run your iris app:

```bash
# drop into a Nanobox console
nanobox run

# where golang is installed,
go version

# git is installed,
git --version

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/golang/iris/add-a-database)
* [Frontend Javascript](/golang/iris/frontend-javascript)
* [Local Environment Variables](/golang/iris/local-evars)
* [Back to Iris overview](/golang/iris)
