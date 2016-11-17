# Ruby from Scratch
Part of what makes Nanobox so useful is you don't even need Ruby installed on your local machine to use it.

## Create a Ruby project
Create a project folder and change into it:

```bash
mkdir nanobox-ruby && cd nanobox-ruby
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: ruby
```

## Create a Ruby App
Since this is a generic app, you get to choose your own adventure!

#### Install Gems
Create a `Gemfile` at the root of your project that includes any gems your app will be using:

```ruby
source "https://rubygems.org"

gem "your_gem"
```

Have Nanobox install your gems by running `bundle install`:

```bash
nanobox run bundle install
```

## Configure App

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0).

#### Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local ruby.dev
```

## Run the app

```bash
nanobox run ruby your_app.rb
```

Visit your app at <a href="http://ruby.dev:3000" target="\_blank">ruby.dev:3000</a>

## Explore
With Nanobox, you have everything you need develop and run your Ruby app:

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
