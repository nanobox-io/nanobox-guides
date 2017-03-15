# React from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or React installed on your local machine to use them.

## Create a React project
Create the project folder and change into it:

```bash
mkdir nanobox-react && cd nanobox-react
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> and enable file-watching:

```yaml
run.config:
  engine: nodejs
  fs_watch: true
```

## Generate a React App

```bash
# drop into a nanobox console
nanobox run

# install create-react-app so we can use it to generate
# our application
yarn global add create-react-app

# cd into the /tmp dir to create an app
cd /tmp

# generate the react app
create-react-app myapp

# cd back into the /app dir
cd -

# copy the generated app into the project
cp -a /tmp/myapp/* .

# exit the console
exit
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local react.dev
```

## Set the Dev Host to 0.0.0.0
To allow connections from the host machine into the app’s container, add a `HOST` environment variable that defines the host on which React listens while developing locally:

```bash
nanobox evar add local HOST=0.0.0.0
```

## Run the app
Start the app with React's "start" script:

```bash
nanobox run yarn start
```

Visit your app at <a href="http://react.dev" target="\_blank">react.dev</a>

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

* [Configure Nodejs](/javascript/react/configure-nodejs)
* [Yarn & NPM](/javascript/react/package-managers)
* [Back to Ember overview](/javascript/react)
