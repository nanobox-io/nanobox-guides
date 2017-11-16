# Nette from Scratch
Part of what makes Nanobox so useful is you don't even need PHP or nette installed on your local machine to use them.

## Create a Nette project
Create Nette project using composer:

```bash
composer create-project nanobox-guides/nanobox-nette && cd nanobox-nette
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
      - memcache
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
nanobox dns add local nette.local
```

## Turn on nette debug mode
You can optinally turn on debug mode. Debug/production mode is handled using environment variable `NETTE_DEVEL`.

```bash
nanobox evar add local NETTE_DEVEL=1
```

## Run the app

```bash
nanobox run php -S 0.0.0.0:8000 -t www
```

Visit your app at <a href="http://nette.local:8000" target="\_blank">nette.local:8000</a>

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
