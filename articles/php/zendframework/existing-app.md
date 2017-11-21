# Existing Zend Framework App

_**PLACEHOLDER:** This whole guide is essentially placeholder content and needs to be replaced with Zend Framework-specific content._

Part of what makes Nanobox so useful is you don't even need php or zendframework installed on your local machine to use them.

## Setup

#### cd into your Zend Framework app
Change into an existing project folder

```bash
cd my-zendframework-app
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
      - ctype
      - dom
      - iconv
      - mbstring
      - pdo
      - session
      - simplexml
      - tokenizer
      - xml
      - zlib
```

## Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local zendframework.local
```

## Run the app

**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/php/zendframework/add-a-database) before your app will run.

```bash
nanobox run php bin/console server:run 0.0.0.0
```

Visit your app at <a href="http://zendframework.local" target="\_blank">zendframework.local</a>

## Explore
With Nanobox, you have everything you need develop and run your Zend Framework app:

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

* [Add a Database](/php/zendframework/add-a-database)
* [Frontend Javascript](/php/zendframework/frontend-javascript)
* [Local Environment Variables](/php/zendframework/local-evars)
* [Back to Zend Framework overview](/php/zendframework)
