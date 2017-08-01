# Feathers from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Feathers installed on your local machine to use them.

## Create a Feathers project
Create the project folder and change into it:

```bash
mkdir nanobox-feathers && cd nanobox-feathers
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Generate an Feathers App

```bash
# drop into a nanobox console
nanobox run

# install feathers so you can use it to generate your application
npm install -g feathers-cli

# generate the feathers app; follow the prompts to create your application
feathers generate app

# exit the yarn console
exit

# exit the nanobox console
exit
```

## Configure Feathers

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, your app needs to listen on all available IP's (0.0.0.0). Feathers does this by default, and so no additional configuration is needed.

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local feathers.dev
```

## Run the app

```bash
nanobox run npm start
```

Visit your app at <a href="http://feathers.dev:3030" target="\_blank">feathers.dev:3030</a>

## Explore
With Nanobox, you have everything you need develop and run your feathers app:

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

* [Add a Database](/nodejs/feathers/add-a-database)
* [Frontend Javascript](/nodejs/feathers/frontend-javascript)
* [Local Environment Variables](/nodejs/feathers/local-evars)
* [Back to Feathers overview](/nodejs/feathers)
