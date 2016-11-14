# Existing Sails App
Part of what makes Nanobox so useful is you don't even need nodejs or sails installed on your local machine to use them.

## Setup

#### cd into your Sails app
Change into an existing project folder

```bash
cd my-sails-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Configure Sails

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container modify the `config/env/development.js` telling sails to listen on all available IP's at port 8080:

```javascript
host: '0.0.0.0'
```

#### Add local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local sails.dev
```

## Run the app
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/nodejs/sails/add-a-database) before your app will run.

```bash
nanobox run sails lift
```

Visit your app -> [sails.dev:1337](http://sails.dev:1337)

## Explore
With Nanobox, you have everything you need develop and run your sails app:

```bash
# drop into a Nanobox console
nanobox run

# where nodejs is installed,
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

* [Add a Database](/nodejs/sails/add-a-database)
* [Frontent Javascipt](/nodejs/sails/frontend-javascript)
* [Local Environment Variables](/nodejs/sails/local-evars)
* [Back to Sails overview](/nodejs/sails)
