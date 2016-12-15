# Existing Nette App
Part of what makes Nanobox so useful is you don't even need php or nette installed on your local machine to use them.

## Setup

#### cd into your Nette app
Change into an existing project folder

```bash
cd my-nette-app
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

    # sets the php version to 7.0
    runtime: php-7.0

    # enables php extensions
    extensions:
      - bcmath
      - ctype
      - dom
      - fileinfo
      - gd
      - json
      - iconv
      - intl
      - mbstring
      - pdo
      - pdo_mysql
      - pdo_sqlite
      - session
      - simplexml
      - tokenizer
      - xml
      - zlib
```

## Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local nette.dev
```

## Run the app

**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/php/nette/add-a-database) before your app will run.

```bash
nanobox run php bin/console server:run 0.0.0.0
```

Visit your app at <a href="http://nette.dev:8000" target="\_blank">nette.dev:8000</a>

## Explore
With Nanobox, you have everything you need develop and run your nette app:

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

* [Add a Database](/php/nette/add-a-database)
* [Frontend Javascript](/php/nette/frontend-javascript)
* [Local Environment Variables](/php/nette/local-evars)
* [Back to Nette overview](/php/nette)
