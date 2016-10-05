# CodeIgniter: Getting Started

This guide will walk you through getting a simple CodeIgniter app up and running with Nanobox. This guide was used to create the [nanobox-codeigniter](https://github.com/nanobox-quickstarts/nanobox-codeigniter) app found under [nanobox-quickstarts](https://github.com/nanobox-quickstarts) on Github.

## Setup Your CodeIgniter Project
If you don't already have a CodeIgniter codebase, you can download and use a fresh one. Downloads are available through the [CodeIgniter Downloads page](http://www.codeigniter.com/user_guide/installation/downloads.html) or from [CodeIgniter's Github repo](https://github.com/bcit-ci/CodeIgniter).

### Add a boxfile.yml
In the root directory of your WordPress project, create a `boxfile.yml`. The [boxfile.yml](https://docs.nanobox.io/app-config/boxfile/) is a yaml config file used to specify the components and configuration need for you app. For a base CodeIgniter install, the boxfile.yml should contain the following:

```yaml
code.build:
  # the php engine provides the php runtime and associated executables
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

## Up and Running
With your boxfile.yml in place , you're ready to get CodeIgniter up and running in your dev environment.


```bash
# build the code
nanobox build

# start the dev environment and deploy your build
nanobox dev deploy

# add a convenient way to access your app from the browser
nanobox dev dns add codeigniter.nanobox.dev

# start PHP-FPM and Apache
nanobox dev run
```

You can visit your running CodeIgniter app at `codeigniter.nanobox.dev:8080`.

## Now What?
Now that you have CodeIgniter running in Nanobox, what's next? Hopefully the topics below will help you get started with the next steps of your development!

- Connecting to a database
- Adding components
- Preparing for production
- Launching your app
