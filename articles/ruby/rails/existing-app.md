# Existing Rails App
Part of what makes nanobox so useful is you don't even need ruby or rails installed on your local machine to use them.

This guide will help you get an existing Rails app up-and-running with nanobox.

## Build a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *bundle install*, *rails console*, and *rake*.

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: ruby
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Configure Rails
To allow connections from the host machine into the app's container modify the `config/boot.rb` telling rails to listen on all available IP's at port 8080:

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

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add rails.nanobox.dev
```

## Rails up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
rails s
```

Once the app has started you can visit it from your favorite browser at `rails.nanobox.dev:8080`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/ruby/rails/add-a-database)
* [Javascript Runtime](/ruby/rails/javascript-runtime)
* [Local Environment Variables](/ruby/rails/local-evars)
* [Back to Rails overview](/ruby/rails)
