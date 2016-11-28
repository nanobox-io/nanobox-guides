# Existing CakePHP App
Part of what makes Nanobox so useful is you don't even need php or CakePHP installed on your local machine to use them.

## Setup

#### cd into your CakePHP app
Change into an existing project folder:

```bash
cd my-cakephp-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the PHP <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  # install php and associated runtimes
  engine: php
  # php engine configuration (php version, extensions, etc)
  engine.config:
    # sets the php version to 7.0
    runtime: php-7.0
```

## Configure CakePHP

#### Enable PHP Extensions
Your app may need specific php extensions to function properly. You can include them in your environment simply by added them to your `boxfile.yml`:

```yaml
run.config:
  engine.config:
    extensions:
      - EXTENSION
```

The full list of available extensions can be found [here](/php/cakephp/php-extensions)

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local cakephp.dev
```

## Run the app

**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/php/cakephp/add-a-database) before your app will run.

```bash
nanobox run php-server
```

Visit your app at <a href="http://cakephp.dev" target="\_blank">cakephp.dev</a>

## Explore
With Nanobox, you have everything you need develop and run your cakephp app:

```bash
# drop into a Nanobox console
nanobox run

# where php is installed,
php -v

# your packages are available,
composer show

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/php/cakephp/add-a-database)
* [Frontend Javascript](/php/cakephp/frontend-javascript)
* [Local Environment Variables](/php/cakephp/local-evars)
* [Back to CakePHP overview](/php/cakephp)
