# Sinatra: Getting Started
This guide will walk you through getting a simple Sinatra app up and running with nanobox. This guide was used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-sinatra" target="\_blank">nanobox-sinatra</a> app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

The guide is broken down into three sections:

1. Project Setup
2. Application Config
3. Up and Running

## Project Setup
If you already have a project you'd like to use with nanobox simply [add a boxfile.yml](#add-a-boxfile-yml) and continue with this guide, otherwise you'll need to follow the next steps to create a new project.

#### Create a project
Decide where you want your project to live and create a folder there

```bash
mkdir nanobox-sinatra
```

Create a `Gemfile` at the root of the project that contains the following:

```ruby
source "https://rubygems.org"

#
gem "sinatra"
```

#### Add a boxfile.yml
Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
code.build:

  # because we're using sinatra we need to tell nanobox that we need ruby in our container
  engine: "ruby"
```

## Application Config
If you already have an application you'd like to run with nanobox you'll simply need to [make it accessible to the host](#make-it-accessible), otherwise follow the steps below to create an application.

#### Create an Application
At the root of the project create a file named `myapp.rb` with the following:

```ruby
require "sinatra"

#
get "/" do
  "Hello nanobox!"
end
```

#### Make it Accessible
Most frameworks by default will bind to localhost, however we need to allow connections from the host into your container. To do this we need to tell sinatra to bind to all available IP's

```ruby
set :bind, "0.0.0.0"
set :port, "8080"
```

## Up and Running
With the application configured the last thing to do is run it with nanobox. From the project directory run the following commands:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# add a convenient way to access your app from the browser
nanobox dev dns add sinatra.nanobox.dev

# console into the dev environment
nanobox dev console

# run the app
bundle exec ruby myapp.rb
```

Visit the app from your favorite browser at `sinatra.nanobox.dev:8080`

## Now what?
Now that you have an application running with nanobox whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* Connecting to a database
* Adding components
* Preparing for production
* Launching your app
