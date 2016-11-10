# Rails from Scratch
Part of what makes Nanobox so useful is you don't even need ruby or rails installed on your local machine to use them.

## Create a Rails project

#### Create a Rails project folder
Decide where you want your project to live and create a folder there:

```bash
# create the folder
mkdir nanobox-rails

# change into the newly created folder
cd nanobox-rails
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

<div class="meta" data-method="configFile" data-params="boxfile.yml"></div>

```yaml
run.config:

  #
  engine: ruby

  engine.config:
    runtime: ruby-2.3

  extra_packages:
    - nodejs

```

## Generate a Rails App

#### Install Rails

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

#### Configure Rails
To allow connections from the host machine into the app's container modify the `config/boot.rb` telling rails to listen on all available IP's:

<div class="meta" data-method="configFile" data-params="config/boot.rb"></div>

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

## Run the app

```bash
nanobox run rails s
```

## Check it out

```bash
# Add a convenient way to access your app from the browser
nanobox dns add local rails.dev
```

Visit your app -> [rails.dev:3000](http://rails.dev:3000)

## Explore

With Nanobox, you have everything you need develop and run your rails app:

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
* [Frontent Javascipt](/ruby/rails/frontend-javascript)
* [Local Environment Variables](/ruby/rails/local-evars)
* [Back to Rails overview](/ruby/rails)