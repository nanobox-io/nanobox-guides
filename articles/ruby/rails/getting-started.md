# Rails: Getting Started
This guide will walk you through getting a simple Rails application (app) up and running with nanobox. This guide was used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-rails" target="\_blank">nanobox-rails</a> app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

This guide is broken down into three sections:

1. [Project Setup](#project-setup)
2. [App Config](#app-config)
3. [Up and Running](#up-and-running)

## Project Setup
If you already have a project you'd like to use with nanobox simply [add a boxfile.yml](#add-a-boxfile-yml) and continue with this guide, otherwise you'll need to follow the next steps to setup a new project.

#### Create a project
Decide where you want your project to live and create a folder there.

```bash
# create your project
mkdir nanobox-rails
```

#### Add a boxfile.yml
Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# because we're using rails we need to tell nanobox that we need ruby in our
# container
code.build:
  engine: "ruby"
```

## App Config
If you already have an app you'd like to run with nanobox you'll simply need to [make it accessible to the host](#make-it-accessible), otherwise follow the steps below to create an app.

#### Create an App
Part of what makes nanobox so useful is you don't have to have rails installed on your local machine to utilize it. We're going to create a development (dev) environment in which you will generate your rails app.

First we need to get a dev environment running:

```bash
# build a ruby runtime
nanobox build

# deploy the ruby runtime into the dev environment
nanobox dev deploy

# console into the dev environment
nanobox dev console

# install rails so we can use it to generate our app
gem install rails

# generate our new rails app
rails new .
```

#### Make it Accessible
Most frameworks by default will bind to localhost, however we need to allow connections from the host into your container. To do this we need to tell rails to bind to all available IP's

In your apps `config/boot.rb` add the following:

```ruby
require 'rails/commands/server'
module Rails
  class Server
    alias :_default_options :default_options
    def default_options
      _default_options.merge!(Host:'0.0.0.0', Port:8080)
    end
  end
end
```

## Up and Running
With the app configured the last thing to do is run it with nanobox. From the project directory run the following commands:

```bash
# build a ruby runtime
nanobox build

# deploy the ruby runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add rails.nanobox.dev

# console into the dev environment
nanobox dev console

# run the app
bundle exec rails s
```

Visit the app from your favorite browser at: `rails.nanobox.dev:8080`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](connect-a-database.html)
* [Prepare for production](prepare-for-production.html)
* [Launch your app](launch-your-app.html)
* [Back to rails overview](overview.html)
