# Existing Express App
Part of what makes Nanobox so useful is you don't even need nodejs or express installed on your local machine to use them.

## Setup

#### cd into your Express app

```bash
# change into your project folder
cd my-express-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

<div class="meta" data-method="configFile" data-params="boxfile.yml"></div>

```yaml
run.config:

  engine: nodejs

  engine.config:
    runtime: nodejs-4.4

  extra_packages:
    - nodejs

```

## Run the app

**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/nodejs/express/add-a-database) before your app will run.

```bash
nanobox run express s
```

## Check it out

```bash
# Add a convenient way to access your app from the browser
nanobox dns add local express.dev
```

Visit your app -> [express.dev:3000](http://express.dev:3000)

## Explore

With Nanobox, you have everything you need develop and run your express app:

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

* [Add a Database](/nodejs/express/add-a-database)
* [Frontent Javascipt](/nodejs/express/frontend-javascript)
* [Local Environment Variables](/nodejs/express/local-evars)
* [Back to Express overview](/nodejs/express)
