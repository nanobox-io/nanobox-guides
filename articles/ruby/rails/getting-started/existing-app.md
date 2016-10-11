# Rails: Getting Started
This guide will walk you through getting a Rails application (app) up and running with nanobox.

This guide is broken down into three sections:

1. [Add a boxfile.yaml](#add-a-boxfile.yml)
2. [Make it accessible](#make-it-accessible)
3. [Up and Running](#up-and-running)

## Add a boxfile.yml
Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# because we're using rails we need to tell nanobox that we need ruby in our
# container
code.build:
  engine: "ruby"
```

## Make it Accessible
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
* [Javascript Runtime](javascript-runtime.html)
* [Local Environment Variables](local-evars.html)
* [Back to rails overview](rails.html)
