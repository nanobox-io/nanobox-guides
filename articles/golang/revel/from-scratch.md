# Revel from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Revel installed on your local machine to use them.

## Create a Revel project
Create the project folder and change into it:

```bash
mkdir nanobox-revel && cd nanobox-revel
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: golang
  engine.config:
    package: nanobox-revel
```

## Generate an Revel App

```bash
# drop into a nanobox console
nanobox run

# install revel so you can use it to generate your application
go get github.com/revel/revel
go get github.com/revel/cmd/revel

# cd into the /src directory on your gopath
cd ..

# generate the revel app
revel new myapp

# copy the generated app into the project
cp -a ./myapp/* ./nanobox-revel

# exit the console
exit
```

## Configure Revel

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, your app needs to listen on all available IP's (0.0.0.0). Revel does this by default, and so no additional configuration is needed.

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local revel.dev
```

## Run the app

```bash
nanobox run revel run nanobox-revel
```

Visit your app at <a href="http://revel.dev:9000" target="\_blank">revel.dev:9000</a>

## Explore
With Nanobox, you have everything you need develop and run your revel app:

```bash
# drop into a Nanobox console
nanobox run

# where go is installed,
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

* [Add a Database](/golang/revel/add-a-database)
* [Frontend Javascript](/golang/revel/frontend-javascript)
* [Local Environment Variables](/golang/revel/local-evars)
* [Back to Revel overview](/golang/revel)
