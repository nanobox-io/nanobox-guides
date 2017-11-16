# Beego from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Beego installed on your local machine to use them.

## Create a Beego project
Create the project folder and change into it:

```bash
mkdir nanobox-beego && cd nanobox-beego
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: golang
  engine.config:
    package: nanobox-beego
```

## Generate an Beego App

```bash
# drop into a nanobox console
nanobox run

# install beego so you can use it to generate your application
go get github.com/astaxie/beego
go get github.com/beego/bee

# generate the beego app; when prompted to overwrite the directory select [Yes]
bee new .

# exit the console
exit
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local beego.local
```

## Configure Beego

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, your app needs to listen on all available IP's (0.0.0.0). Beego does this by default, and so no additional configuration is needed.

## Run the app

```bash
nanobox run bee run
```

Visit your app at <a href="http://beego.local:8080" target="\_blank">beego.local:8080</a>

## Explore
With Nanobox, you have everything you need develop and run your beego app:

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

* [Add a Database](/golang/beego/add-a-database)
* [Frontend Javascript](/golang/beego/frontend-javascript)
* [Local Environment Variables](/golang/beego/local-evars)
* [Back to Beego overview](/golang/beego)
