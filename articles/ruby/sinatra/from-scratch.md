# Sinatra from Scratch
Part of what makes Nanobox so useful is you don't even need ruby or sinatra installed on your local machine to use them.

## Create a Sinatra project

#### Create a Sinatra project folder
Decide where you want your project to live and create a folder there:

```bash
# create the folder
mkdir nanobox-sinatra

# change into the newly created folder
cd nanobox-sinatra
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

## Create a Sinatra App
Create a basic sinatra app named `myapp.rb` at the root of your project:

```ruby
require "sinatra"

#
get "/" do
  "Hello nanobox!"
end
```

Also, create a `Gemfile` that includes sinatra:

```ruby
source "https://rubygems.org"

#
gem "sinatra"
```

#### Configre Sinatra
To allow connections from the host machine into the app's container modify the `myapp.rb` telling sinatra to listen on all available IP's:

```ruby
set :bind, "0.0.0.0"
```

## Run the app

```bash
nanobox run ruby myapp.rb
```

## Check it out

```bash
# Add a convenient way to access your app from the browser
nanobox dns add local sinatra.dev
```

Visit your app -> [sinatra.dev:3000](http://sinatra.dev:3000)

## Explore

With Nanobox, you have everything you need develop and run your sinatra app:

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

* [Add a Database](/ruby/sinatra/add-a-database)
* [Frontent Javascipt](/ruby/sinatra/frontend-javascript)
* [Local Environment Variables](/ruby/sinatra/local-evars)
* [Back to Sinatra overview](/ruby/sinatra)
