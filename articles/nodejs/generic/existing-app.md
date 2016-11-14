# Existing Node App
Part of what makes Nanobox so useful is you don't even need node installed on your local machine to use it.

## Setup

#### cd into your Node app
Change into an existing project folder

```bash
cd my-node-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the node <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Configure App

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to bind to 0.0.0.0.

Here is an example with Express:

```javascript
server.listen(port, '0.0.0.0');
```

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local node.dev
```

## Run the app
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/nodejs/generic/add-a-database) before your app will run.

```bash
nanobox run node YOURAPP.js
```

Visit your app -> [nodejs.dev:3000](http://nodejs.dev:3000)

## Explore
With Nanobox, you have everything you need develop and run your node app:

```bash
# drop into a Nanobox console
nanobox run

# where node is installed,
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

* [Add a Database](/nodejs/generic/add-a-database)
* [Frontent Javascipt](/nodejs/generic/frontend-javascript)
* [Local Environment Variables](/nodejs/generic/local-evars)
* [Back to Node overview](/nodejs/generic)
