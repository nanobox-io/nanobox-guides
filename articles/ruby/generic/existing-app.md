# Existing Ruby App
Part of what makes Nanobox so useful is you don't even need ruby installed on your local machine to use it.

## Setup

#### cd into your Ruby app
Change into an existing project folder

```bash
cd my-ruby-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: ruby
```

## Configure App

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to bind to 0.0.0.0.

Here is an example with Sinatra:

```ruby
set :bind, "0.0.0.0"
```

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local ruby.dev
```

## Run the app
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/ruby/generic/add-a-database) before your app will run.

```bash
nanobox run ruby YOURAPP.rb
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
