# Ember from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Ember installed on your local machine to use them.

## Create a Ember project
Create a project folder and change into it:

```bash
mkdir nanobox-ember && cd nanobox-ember
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Generate an Ember App

```bash
# drop into a nanobox console
nanobox run

# install ember so we can use it to generate our application
npm install -g ember-cli

# generate our new ember application; due to a limitation in ember we'll have to generate our app in another folder and move it where we want it

# cd into the /tmp dir to create an app
cd /tmp

# generate the ember app
ember new tmp-app

# cd back into the /app dir
cd -

# copy the generated app into the project
cp -a /tmp/tmp-app/* .

# exit the console
exit
```

## Configure Ember

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0) by modifying the `.ember-cli`:

```javascript
{
  "host" : "0.0.0.0"
}
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local ember.dev
```

## Run the app

```bash
nanobox run ember server
```

Visit your app at <a href="http://ember.dev:4200" target="\_blank">ember.dev:4200</a>

## Explore
With Nanobox, you have everything you need develop and run your ember app:

```bash
# drop into a Nanobox console
nanobox run

# where nodejs is installed,
node -v

# your packages are available,
npm list

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Configure Nodejs](/javascript/ember/configure-nodejs)
* [Yarn & NPM](/javascript/ember/package-managers)
* [Back to Ember overview](/javascript/ember)
