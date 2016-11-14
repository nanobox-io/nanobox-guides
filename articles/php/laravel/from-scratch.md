# Laravel from Scratch
Part of what makes Nanobox so useful is you don't even need PHP or laravel installed on your local machine to use them.

## Create a Laravel project

#### Create a Laravel project folder
Create a project folder and change into it

```bash
mkdir nanobox-laravel && cd nanobox-laravel
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the php <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:

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
      - xml

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

## Generate a Laravel App

#### Install Laravel
With your dev environment running, you can console into it and install Laravel.

```bash
# drop into a nanobox console
nanobox run

# download the laravel installer
composer global require "laravel/installer"

# create a new laravel app
laravel new

# exit the console
exit
```

## Start PHP-FPM & Apache

```bash
# run the start commands specified in your boxfile.yml
nanobox dev run
```

## Run the app

```bash
nanobox run rails s
```

Visit your app -> [rails.dev:3000](http://rails.dev:3000)

## Explore
With Nanobox, you have everything you need develop and run your rails app:

```bash
# drop into a Nanobox console
nanobox run

# where php is installed,
php -v

# your gems are available,
gem list

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/php/laravel/add-a-database)
* [Frontent Javascipt](/php/laravel/frontend-javascript)
* [Local Environment Variables](/php/laravel/local-evars)
* [Back to Laravel overview](/php/laravel)
