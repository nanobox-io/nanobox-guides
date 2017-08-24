# Play from Scratch
Part of what makes Nanobox so useful is you don't even need Scala or Play installed on your local machine to use them.

## Create a Play project
Create a project folder and change into it:

```bash
mkdir nanobox-play && cd $_
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Scala <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: scala
```

## Create a Play App

```bash
# cd into a tmp dir
cd /tmp

# use the sbt play generator to create a new app
sbt new playframework/play-scala-seed.g8

# cd back into the app directory
cd -

# copy the generated app back to the source directory (substituting your app name below)
cp -a /tmp/<your-app-name>/* .

```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local play.dev
```

Ensure the custom domain is allowed by adding to the `conf/application.conf`:

```scala
play.filters.hosts = {
  allowed = ["play.dev:9000"]
}
```

## Run the app

```bash
sbt run
```

Visit your app at <a href="http://play.dev:9000" target="\_blank">play.dev:9000</a>

## Explore
With Nanobox, you have everything you need develop and run your Play app:

```bash
# drop into a Nanobox console
nanobox run

# where scala is installed,
scala -version

# sbt is available
sbt help

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/scala/play/add-a-database)
* [Frontend Javascript](/scala/play/frontend-javascript)
* [Local Environment Variables](/scala/play/local-evars)
* [Back to Play overview](/scala/play)
