# Sinatra from Scratch
Part of what makes Nanobox so useful is you don't even need Ruby or Sinatra installed on your local machine to use them.

## Create a Sinatra project
Create a project folder and change into it:

```bash
mkdir nanobox-sinatra && cd nanobox-sinatra
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: ruby
```

## Create a Sinatra App
Create a basic Sinatra app at the root of your project named `app.rb`:

```ruby
require 'sinatra'

class App < Sinatra::Base
  get '/' do
    'Hello Nanobox!'
  end
end
```

Add a `config.ru` file:

```ruby
require './app'
run App
```

And a `Gemfile` that includes Sinatra:

```ruby
source "https://rubygems.org"

gem "sinatra"
```

#### Install Sinatra
Have Nanobox install Sinatra by running `bundle install`

```bash
nanobox run bundle install
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local sinatra.dev
```

## Run the app
To allow connections from the host machine into the app's container, you'll need to run your app so it listens on all available IP's (0.0.0.0).

```bash
nanobox run rackup --host 0.0.0.0
```

Visit your app at <a href="http://sinatra.dev:9292" target="\_blank">sinatra.dev:9292</a>

## Explore
With Nanobox, you have everything you need develop and run your Sinatra app:

```bash
# drop into a Nanobox console
nanobox run

# where ruby is installed,
ruby -v

# your gems are available,
bundle exec gem list

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/ruby/sinatra/add-a-database)
* [Frontent Javascipt](/ruby/sinatra/frontend-javascript)
* [Local Environment Variables](/ruby/sinatra/local-evars)
* [Back to Sinatra overview](/ruby/sinatra)
