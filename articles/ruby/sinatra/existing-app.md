# Existing Sinatra App
Part of what makes Nanobox so useful is you don't even need ruby or sinatra installed on your local machine to use them.

## Setup

#### cd into your Sinatra app
Change into an existing project folder

```bash
cd my-sinatra-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the ruby <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: ruby
```

## Configure Sinatra

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container modify the `myapp.rb` telling sinatra to listen on all available IP's:

```ruby
set :bind, "0.0.0.0"
```

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local sinatra.dev
```

## Run the app
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/ruby/sinatra/add-a-database) before your app will run.

```bash
nanobox run ruby myapp.rb
```

Visit your app -> [sinatra.dev:4567](http://sinatra.dev:4567)

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
