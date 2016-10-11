# Rails from Scratch
This guide will walk you through getting a simple Rails application (app) up and running with nanobox. This guide was used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-rails" target="\_blank">nanobox-rails</a> app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Create a project
Decide where you want your project to live and create a folder there:

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

## Create an App
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
* [Javascript Runtime](javascript-runtime.html)
* [Local Environment Variables](local-evars.html)
* [Back to rails overview](rails.html)
