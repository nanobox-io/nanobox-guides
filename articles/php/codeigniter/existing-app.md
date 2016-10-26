# Starting with an Existing CodeIgniter App

Part of what makes Nanobox so useful is you don't have to have PHP, Apache, etc., installed on your local machine to run CodeIgniter apps. This guide walks through getting an existing CodeIgniter app up and running with Nanobox.

*If you don't have an existing CodeIgniter project, the [CodeIgniter from Scratch guide](/php/codeigniter//from-scratch) is where you should start.*

## Build a PHP Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside it. From within this environment you can run the app or other tasks as you would normally.

### Add a boxfile.yml
The [boxfile.yml](https://docs.nanobox.io/boxfile/) tells Nanobox how to build and configure your environment. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
code.build:
  # the php engine provides the php runtime
  # and associated executables
  engine: php
  config:
    # tells nanobox to use php 7.0
    runtime: php-7.0
    # enables php extensions
    extensions:
      # required by composer
      - phar
      - filter
      - json
      - hash
      - zip
      - dom

# creates a web component in sim and production environments
web.codeigniter:
  # starts PHP-FPM and Apache
  start:
    fpm: start-php
    apache: start-apache
  # pipes log output into your app's log stream
  log_watch:
    apache[access]: /data/var/log/apache/access.log
    apache[error]: /data/var/log/apache/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
```

### Build the Environment
With your boxfile.yml in place , you're ready to get CodeIgniter up and running in your dev environment.

```bash
# build the code
nanobox build

# start the dev environment and deploy your build
nanobox dev deploy

# add a convenient way to access your app from the browser
nanobox dev dns add codeigniter.nanobox.dev
```

## Start PHP-FPM and Apache
Run the following to start PHP-FPM and Apache.

```bash
# run the start commands specified in your boxfile.yml
nanobox dev run
```

You can visit your running CodeIgniter app at `codeigniter.nanobox.dev`.

## Now What?
Now that you have CodeIgniter running in Nanobox, what's next? Hopefully the topics below will help you get started with the next steps of your development!

- Connecting to a database
- Adding components
- Preparing for production
- Launching your app
