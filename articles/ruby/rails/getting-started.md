# Rails: Getting Started
This guide will walk you through getting a simple Rails app up and running with nanobox. This guide was used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-rails" target="\_blank">nanobox-rails</a> app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

The guide is broken down into three sections:

1. [Project Setup](#project-setup)
2. [Application Config](#application-config)
3. [Up and Running](#up-and-running)

## Project Setup
If you already have a project you'd like to use with nanobox simply [add a boxfile.yml](#add-a-boxfile-yml) and continue with this guide, otherwise you'll need to follow the next steps to create a new project.

#### Create a project
Decide where you want your project to live and create a folder there

```bash
# create your project
mkdir nanobox-rails
```

#### Add a boxfile.yml
Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
code.build:

  # because we're using rails we need to tell nanobox that we need ruby in our
  # container
  engine: "ruby"
```

## Application Config
If you already have an application you'd like to run with nanobox you'll simply need to [make it accessible to the host](#make-it-accessible), otherwise follow the steps below to create an application.

#### Create an Application
Part of what makes nanobox so useful is you don't have to have rails installed on your local machine to utilize it. We're going to create a development environment in which you will generate your rails application.

First we need to get a development environment running:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# console into the dev environment
nanobox dev console

# install rails so we can use it to generate our application
gem install rails

# generate our new rails application
rails new .
```

#### Make it Accessible
Most frameworks by default will bind to localhost, however we need to allow connections from the host into your container. To do this we need to tell rails to bind to all available IP's

In your applications `config/boot.rb` add the following:

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
With the application configured the last thing to do is run it with nanobox. From the project directory run the following commands:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# add a convenient way to access your app from the browser
nanobox dev dns add rails.nanobox.dev

# console into the dev environment
nanobox dev console

# run the app
bundle exec rails s
```

Visit the app from your favorite browser at: `rails.nanobox.dev:8080`

## Now what?
Now that you have an application running with nanobox whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connecting to a database](connecting-a-database.html)
* [Preparing for production](preparing-for-production.html)
* [Launching your app](launching-your-app.html)
