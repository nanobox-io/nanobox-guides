# Rails from Scratch
Part of what makes nanobox so useful is you don't have to have ruby or rails installed on your local machine.

This guide will help you get an existing Rails app up-and-running with nanobox.

## Build a Ruby Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a rails console, or even rake tasks as you would normally.

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
nanobox dev dns add rails.nanobox.dev
```

## Configure your Rails App
We need to allow connections from the host into the app's container. To do this we need modify the `config/boot.rb` telling rails to listen on all available IP's at port 8080:

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

## Rails up-and-running
With the app configured the last thing to do is run it:

```bash
# run the app from the nanobox dev console
rails s
```

Visit the app from your favorite browser at: `rails.nanobox.dev:8080`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](connect-a-database.html)
* [Javascript Runtime](javascript-runtime.html)
* [Local Environment Variables](local-evars.html)
* [Back to rails overview](rails.html)
