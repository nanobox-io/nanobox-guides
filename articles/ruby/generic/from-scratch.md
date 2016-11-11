# Ruby App from Scratch
Part of what makes Nanobox so useful is you don't even need ruby installed on your local machine to use it.

## Create a Ruby project

#### Create a Ruby project folder
Create a project folder and change into it:

```bash
mkdir nanobox-ruby-app && cd nanobox-ruby-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: ruby
```

## Generate a Ruby App

#### Install Gems

Create a `Gemfile` at the root of your project that includes whatever gems you will need:

```ruby
source "https://rubygems.org"

gem "YOUR GEM HERE"
```

Then install your gems:

```bash
nanobox run bundle install
```

#### Create a Basic App

Since this is a generic app, you get to choose your own adventure!


#### Configure App

You'll need to configure your app to bind to 0.0.0.0. 

Here is an example with Sinatra:

```ruby
set :bind, "0.0.0.0"
```

## Run the app

```bash
nanobox run ruby YOURAPP.rb
```

## Check it out

```bash
# Add a convenient way to access your app from the browser
nanobox dns add local ruby.dev
```

Visit your app -> [ruby.dev:3000](http://ruby.dev:3000)

## Explore

With Nanobox, you have everything you need develop and run your ruby app:

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

* [Add a Database](/ruby/generic/add-a-database)
* [Frontent Javascipt](/ruby/generic/frontend-javascript)
* [Local Environment Variables](/ruby/generic/local-evars)
* [Back to Ruby overview](/ruby/generic)
