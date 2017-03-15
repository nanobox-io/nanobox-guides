# Creating a Javascript App
The majority of Javascript applications are built on top of another underlying application. This guide walks through this specific use case - a front-end javascript app on top of backend application.

## Create a New Project
Create the project folder and change into it:

```bash
mkdir nanobox-myjsapp && cd nanobox-myjsapp
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

### Add a boxfile.yml
Nanobox uses the <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml`. In the boxfile.yml, the `engine` defines the runtime your app needs to run. If you're front-end and backend both use Node.js/npm/yarn, the config is simple, using just the <a href="https://github.com/nanobox-io/nanobox-engine-nodejs" target="\_blank">Node.js engine</a>:

#### JS App with Node.js Backend
```yaml
run.config:
  engine: nodejs
```

If your backend is built in a language other than Node.js, there's just a few extra things to include. The `engine` should be set to the langauge of your backend.

#### JS App with Different Language Backend
```yaml
# example js/bower app with a ruby backend
run.config:
  engine: ruby
  extra_packages:
    - nodejs
  cache_dirs:
    - node_modules
  extra_path_dirs:
    - node_modules/.bin
  extra_steps:
    - yarn  
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local myapp.dev
```

## Set the Host to 0.0.0.0
To allow connections from the host machine into the app’s container, your app must listen on `0.0.0.0`, not `localhost`.

## Run the app
Start the app with `nanobox run` and whatever command you normally use to start the app:

```bash
# Example
nanobox run yarn start
```

Visit your app at <a href="http://myapp.dev" target="\_blank">myapp.dev</a>

## Explore
With Nanobox, you have everything you need develop and run your React app:

```bash
# drop into a Nanobox console
nanobox run

# where node is installed,
node -v

# yarn is installed,
yarn --version

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Configure Node.js](/javascript/react/configure-nodejs)
* [Yarn & NPM](/javascript/react/package-managers)
* [Back to Ember overview](/javascript/react)
