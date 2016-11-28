# Rails from Scratch
Part of what makes Nanobox so useful is you don't even need Ruby or Rails installed on your local machine to use them.

## Create a Rails project
Create a project folder and change into it:

```bash
mkdir nanobox-rails && cd nanobox-rails
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: ruby

  extra_packages:
    - nodejs
```

## Generate a Rails App

```bash
# drop into a nanobox console
nanobox run

# install the rails gem so we can use it to generate our app
gem install rails

# generate our new rails app
rails new .

# exit the console
exit
```

## Configure Rails

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0) by modifying the `config/boot.rb`:

```ruby
require 'rails/commands/server'
module Rails
  class Server
    alias :_default_options :default_options
    def default_options
      _default_options.merge!(Host:'0.0.0.0')
    end
  end
end
```

#### Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local rails.dev
```

## Run the app

```bash
nanobox run rails s
```

Visit your app at <a href="http://rails.dev:3000" target="\_blank">rails.dev:3000</a>

## Explore
With Nanobox, you have everything you need develop and run your Rails app:

```bash
# drop into a Nanobox console
nanobox run

# where ruby is installed,
ruby -v

# your gems are available,
gem list

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/ruby/rails/add-a-database)
* [Frontend Javascript](/ruby/rails/frontend-javascript)
* [Local Environment Variables](/ruby/rails/local-evars)
* [Back to Rails overview](/ruby/rails)
