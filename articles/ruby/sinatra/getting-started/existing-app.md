# Existing Sinatra App
Part of what makes nanobox so useful is you don't have to have ruby or sinatra installed on your local machine.

This guide will help you get an existing Sinatra app up-and-running with nanobox.

## Build a Ruby Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a sinatra console, or even rake tasks as you would normally.

#### Add a boxfile.yml
The boxfile.yml tells nanobox how to build and configure these environments. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# tell nanobox to build a ruby runtime
code.build:
  engine: ruby
```

#### Build the Environment

```bash
# build a ruby runtime
nanobox build

# deploy the ruby runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add sinatra.nanobox.dev
```

## Configure your Sinatra App
We need to allow connections from the host into the app's container. To do this we need modify the app to tell sinatra to listen on all available IP's at port 8080:

```ruby
set :bind, "0.0.0.0"
set :port, "8080"
```

## Sinatra up-and-running
With the app configured the last thing to do is run it:

```bash
# run the app from the nanobox dev console
ruby myapp.rb
```

Visit the app from your favorite browser at: `sinatra.nanobox.dev:8080`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](/ruby/sinatra/connect-a-database)
* [Javascript Runtime](/ruby/sinatra/javascript-runtime)
* [Local Environment Variables](/ruby/sinatra/local-evars)
* [Back to Sinatra overview](/ruby/sinatra)
