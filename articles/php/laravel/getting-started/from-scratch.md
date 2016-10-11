# Laravel from Scratch

This guide walks through creating a simple Laravel app from scratch with with Nanobox. The process outlined here is the same process used to create the [nanobox-laravel](https://github.com/nanobox-quickstarts/nanobox-laravel) quickstart found under [nanobox-quickstarts](https://github.com/nanobox-quickstarts) on Github.

*If you have an existing Laravel project, the [Existing Laravel App guide](/php/laravel/getting-started/existing-app) is where you should start.*

## Create a New Project
Create a new project directory and cd into it.

```bash
# create a new project directory
mkdir nanobox-laravel

# navigate into the new directory
cd nanobox-laravel
```

In your new directory, create a file named [`boxfile.yml`](https://docs.nanobox.io/boxfile) that contains the following:

```yaml
code.build:

  # tells nanobox to install php and associated runtimes
  engine: php
  config:

    # sets the php version to 7.0
    runtime: php-7.0

    # specifies the webserver document_root
    document_root: public

    # enables php extensions
    extensions:

      # required by laravel
      - pdo
      - mbstring
      - tokenizer
      - session

      # required by composer
      - phar
      - filter
      - json
      - hash
      - zip
      - dom

# creates a web component in sim and production environments
web.laravel:

  # commands to start PHP-FPM and Apache
  start:
    fpm: start-php
    apache: start-apache

  # pipes log output in your app's log-stream
  log_watch:
    apache[access]: /data/var/log/apache/access.log
    apache[error]: /data/var/log/apache/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
    laravel[error]: /app/storage/logs/laravel.log
```

## Up and Running
With the your boxfile.yml in place, you're ready to create your development (dev) environment. From your project directory, run:

```bash
# build the code
nanobox build

# start the dev environment
nanobox dev start

# add a convenient way to access your app from the browser
nanobox dev dns add laravel.nanobox.dev
```

### Install Laravel
With your dev environment running, you're ready to install Laravel. This can be done by consoling into your dev environment and running the laravel installer.

```bash
# console into the dev environment
nanobox dev console

# download the laravel installer
composer global require "laravel/installer"

# install laravel
laravel new
```

### Start PHP-FPM & Apache
Either `exit` out of your dev console or open a new terminal window and run the following to start PHP-FPM and Apache.

```bash
# run the start commands specified in your boxfile.yml
nanobox dev run
```

### View the App in Your Browser
With your app running, you can access it at `laravel.nanobox.dev:8080` in your browser of choice.

## Now What?
Now that you have Laravel running on Nanobox, what's next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* Connecting to a database
* Adding components
* Preparing for production
* Launching your app
