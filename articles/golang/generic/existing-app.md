# Existing Golang App
Part of what makes Nanobox so useful is you don't even need golang installed on your local machine to use it.

## Setup

#### cd into your Golang app
Change into an existing project folder

```bash
cd your-golang-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: golang
  engine.config:
    package: your-golang-app
```

## Configure App

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0).

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local golang.dev
```

## Run the app
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/golang/generic/add-a-database) before your app will run.

```bash
nanobox run go run YOURAPP.go
```

Visit your app at <a href="http://golang.dev:8080" target="\_blank">golang.dev:8080</a>

## Explore
With Nanobox, you have everything you need develop and run your Golang app:

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

* [Add a Database](/golang/generic/add-a-database)
* [Frontend Javascript](/golang/generic/frontend-javascript)
* [Local Environment Variables](/golang/generic/local-evars)
* [Back to Golang overview](/golang/generic)
