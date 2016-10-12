# Sinatra from Scratch
Part of what makes nanobox so useful is you don't have to have ruby or sinatra installed on your local machine.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-sinatra" target="\_blank">nanobox-sinatra</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a sinatra console, or even rake tasks as you would normally.

Decide where you want your project to live and create a folder there:

```bash
# create a project folder
mkdir nanobox-sinatra
```

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

## Create a Sinatra App
At the root of the project create a file named `myapp.rb` with the following:

```ruby
require "sinatra"

#
get "/" do
  "Hello nanobox!"
end
```

We also need to create a `Gemfile` at the root of the project that contains the following:

```ruby
source "https://rubygems.org"

#
gem "sinatra"
```

#### Make App Accessible
We need to allow connections from the host into the app's container. To do this we need modify `myapp.rb` to tell sinatra to listen on all available IP's at port 8080:

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

* [Connect a database](connect-a-database.html)
* [Javascript Runtime](javascript-runtime.html)
* [Local Environment Variables](local-evars.html)
* [Back to sinatra overview](sinatra.html)
