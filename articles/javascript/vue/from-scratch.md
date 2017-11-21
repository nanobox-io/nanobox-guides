# Vue from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Vue installed on your local machine to use them.

## Create a Vue project
Create the project folder and change into it:

```bash
mkdir nanobox-vue && cd nanobox-vue
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Generate a Vue App

```bash
# drop into a nanobox console
nanobox run

# install vue-cli so we can use it to generate our application
npm install -g vue-cli

# create a new project using the "webpack" template
vue init webpack

# follow the installer prompts to configure your app (using the defaults is just fine)

# make sure npm is up-to-date
npm install -g npm

# exit the console
exit
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local vue.local
```

## Run the app
To allow connections from the host machine into the app's container, you'll need to run your app so it listens on all available IP's (0.0.0.0):

```bash
nanobox run npm run dev --host 0.0.0.0
```

Visit your app at <a href="http://vue.local" target="\_blank">vue.local</a>

## Explore
With Nanobox, you have everything you need develop and run your vue app:

```bash
# drop into a Nanobox console
nanobox run

# where node is installed,
node -v

# npm is installed,
npm -v

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Configure Nodejs](/javascript/vue/configure-nodejs)
* [Yarn & NPM](/javascript/vue/package-managers)
* [Back to Ember overview](/javascript/vue)
