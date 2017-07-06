# Elixir from Scratch
Part of what makes nanobox so useful is you don't even need Elixir installed on your local machine to use it.

## Create an Elixir project
Create a project folder and change into it:

```bash
mkdir nanobox-elixir-app && cd nanobox-elixir-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Elixir <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  # elixir runtime
  engine: elixir
```

## Generate an Elixir App
```bash
# drop into a nanobox console
nanobox run

# cd into the /tmp dir to create an app
cd /tmp

# generate the elixir app (Use your own app name)
mix new myapp

# cd back into the /app dir
cd -
  
# copy the generated app into the project
cp -a /tmp/myapp/* .

# exit the console
exit
```

## Fetch your Dependencies
Inside of your Nanobox console, fetch your app's dependencies:

```bash
mix deps.get
```

## Configure App

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0).

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local elixir.dev
```

## Run the app
To run the app and drop into an interactive iex session:

```bash
nanobox run iex -S mix
```

Visit your app at <a href="http://elixir.dev>" target="\_blank">elixir.dev</a>

## Explore
With Nanobox, you have everything you need develop and run your Elixir app:

```bash
# drop into a Nanobox console
nanobox run

# where elixir is installed
elixir -v

# your packages are available
mix list

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/elixir/generic/add-a-database)
* [Frontend Javascript](/elixir/generic/frontend-javascript)
* [Local Environment Variables](/elixir/generic/local-evars)
* [Back to Elixir overview](/elixir/generic)
