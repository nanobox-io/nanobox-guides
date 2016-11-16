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
  # install php and associated runtimes
  engine: php
  
  # php engine configuration (php version, extensions, etc)
  engine.config:

    # sets the php version to 7.0
    runtime: php-7.0

    # enables php extensions
    extensions:
      - pdo
      - mbstring
      - tokenizer
      - session
      - zip
      - dom
      - xml
      - ctype
```

## Generate a Laravel App

#### Install Laravel

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

#### Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local laravel.dev
```

## Run the app

```bash
nanobox run php artisan serve --host 0.0.0.0
```

Visit your app -> [laravel.dev:8000](http://laravel.dev:8000)

## Explore
With Nanobox, you have everything you need develop and run your laravel app:

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

* [Add a Database](/php/laravel/add-a-database)
* [Frontent Javascipt](/php/laravel/frontend-javascript)
* [Local Environment Variables](/php/laravel/local-evars)
* [Back to Laravel overview](/php/laravel)
