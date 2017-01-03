# Existing Phalcon App
Part of what makes Nanobox so useful is you don't even need php or phalcon installed on your local machine to use them.

## Setup

#### cd into your Phalcon app
Change into an existing project folder

```bash
cd my-phalcon-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the php <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  # install php and associated runtimes
  engine: php

  # php engine configuration (php version, extensions, etc)
  engine.config:

    # set the php version
    runtime: php-7.1

    # set your app's document root  
    document_root: public

    # include the phalcon extension
    extensions:
      - phalcon

  # for convenience - adds a bash alias for phalcon devtools
  extra_steps:
    - echo "alias phalcon=\'phalcon.php\'" >> /data/var/home/gonano/.bashrc
```

## Add Phalcon Devtools to your composer.json
If you want to install and use Phalcon Devtools, add the follwoing to your `composer.json`:

```json
{
    "require-dev": {
        "phalcon/devtools": "~3.0.3"
    }
}
```

**Note:** *The version of phalcon devtools depends on which php version you're using*

## Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local phalcon.dev
```

## Run the app

**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/php/phalcon/add-a-database) before your app will run.

```bash
nanobox run php-server
```

Visit your app at <a href="http://phalcon.dev" target="\_blank">phalcon.dev</a>

## Explore
With Nanobox, you have everything you need develop and run your phalcon app:

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

* [Add a Database](/php/phalcon/add-a-database)
* [Frontend Javascript](/php/phalcon/frontend-javascript)
* [Local Environment Variables](/php/phalcon/local-evars)
* [Back to Phalcon overview](/php/phalcon)
