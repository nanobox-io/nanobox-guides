# Rails: Launching your application
Once your application is running locally and you've developed it to a point where you're beginning to think about production, nanobox can help you test your application as if it were running in a production environment without actually having one.

The guide is broken down into three sections:

1. [Dev vs Sim](dev-vs-sim)
2. [Setting up a sim environment](setting-up-a-sim-environment)
3. [Sim up and running](sim-up-and-running)

## Dev vs Sim
The nanobox development environment is just that. It's a local running instance of your application. It doesn't compile assets or run a web server.

The nanobox simulation environment (sim for short) is an exact replica of a production environment running locally. All this means is your application will run in sim as if it were running in production, just not on a live server. If your application runs in `sim` *it will run in production*. Guaranteed.

You use `sim` in the same way you use `dev`, it just requires a little bit of extra setup.

## Setting up a sim environment
Setting up the sim environment is just like the dev environment however you'll need to include a few extra things in your `boxfile.yml`:

#### Adding a web server
```yaml
code.build:

  # because we're using rails we need to tell nanobox that we need ruby in our container
  engine: "ruby"

# specify that we need a data component (called "db")
data.db:

  # for this example we'll used postgresql as our database
  image: nanobox/postgresql

# we need to specify a web component to run our application in
web.site:

  # we need to tell nanobox how we start our server
  start: 'bundle exec rails s'
```

#### Build and deploy the sim environment
Once we've specified our sim environment we need to provision it and deploy it into the sim runtime:

```bash
# build your new environment
nanobox build

# deploy the environment to the sim runtime
nanobox sim deploy
```

## Sim up and running
With our sim environment created and deployed lets test it!

```bash
# build the code
nanobox build

# compile the application
nanobox compile

# start the sim environment
nanobox sim start

# add a convenient way to access your app from the browser
nanobox sim dns add rails.nanobox.sim

# console into the sim environment
nanobox sim deploy
```

Visit the app from your favorite browser at: `rails.nanobox.sim:8080`

## Now what?
Now with your application running in `sim` whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* [Launching your app](launching-your-app.html)
