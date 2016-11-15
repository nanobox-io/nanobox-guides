# Symfony from Scratch
Part of what makes Nanobox so useful is you don't even need PHP or symfony installed on your local machine to use them.

## Create a Symfony project

#### Create a Symfony project folder
Create a project folder and change into it

```bash
mkdir nanobox-symfony && cd nanobox-symfony
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

      # required by symfony
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
web.symfony:

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
    symfony[error]: /app/storage/logs/symfony.log
```

## Generate a Symfony App

#### Install Symfony
With your dev environment running, you can console into it and install Symfony.

```bash
# drop into a nanobox console
nanobox run

# download the symfony installer
composer global require "symfony/installer"

# create a new symfony app
symfony new

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

* [Add a Database](/php/symfony/add-a-database)
* [Frontent Javascipt](/php/symfony/frontend-javascript)
* [Local Environment Variables](/php/symfony/local-evars)
* [Back to Symfony overview](/php/symfony)
