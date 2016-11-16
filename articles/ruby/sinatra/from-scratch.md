# Sinatra from Scratch
Part of what makes Nanobox so useful is you don't even need ruby or sinatra installed on your local machine to use them.

## Create a Sinatra project

#### Create a Sinatra project folder
Create a project folder and change into it

```bash
mkdir nanobox-sinatra && cd nanobox-sinatra
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: ruby
```

## Generate a Sinatra App

#### Install Sinatra
Create a `Gemfile` at the root of your project that includes sinatra:

```ruby
source "https://rubygems.org"

gem "sinatra"
```

Then install sinatra:

```bash
nanobox run bundle install
```

#### Create a Sinatra App
Create a basic sinatra app at the root of your project named `app.rb`:

```ruby
require 'sinatra'

class App < Sinatra::Base
  get '/' do
    'Hello Nanobox!'
  end
end
```

Next, add a `config.ru` file:

```ruby
require './app'
run App
```

## Configre Sinatra

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local sinatra.dev
```

## Run the app
To allow connections from the host machine into the app's container run the app so that it listens on all available IP's:

```bash
nanobox run rackup --host 0.0.0.0
```

Visit your app -> <a href="http://sinatra.dev:9292" target="\_blank">sinatra.dev:9292</a>

**HEADS UP**: You can stop your app with `ctrl + c`

## Explore
With Nanobox, you have everything you need develop and run your sinatra app:

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
