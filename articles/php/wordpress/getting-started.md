# WordPress: Getting Started

This guide will walk you through getting a WordPress app up and running on Nanobox. This guide was used in the creation of the [nanobox-wordpress](https://github.com/nanobox-quickstarts/nanobox-wordpress) app found under [nanobox-quickstarts](https://github.com/nanobox-quickstarts) on Github.

## Setup Your WordPress Project
If you don't already have a WordPress codebase, you can download and use a fresh one. Downloads are available through the [WordPress Downloads page](https://wordpress.org/download/) or from [WordPress' Github repo](https://github.com/wordpress/wordpress).

### Add a boxfile.yml
In the root directory of your WordPress project, create a `boxfile.yml`. The [boxfile.yml](https://docs.nanobox.io/boxfile/) is a yaml config file used to specify the components and configuration need for you app. For WordPress, the boxfile should contain the following:

*For a detailed explanation of each of the WordPress boxfile.yml config settings, view the [WordPress boxfile.yml Explained guide](advanced/boxfile-explained/).*

```yaml
code.build:
  engine: php
  config:
    runtime: php-7.0
    extensions:
      - gd
      - mysqli
      - curl
      - zlib

web.wp:
  start:
    fpm: start-php
    apache: start-apache
  log_watch:
    apache[access]: /data/var/log/apache/access.log
    apache[error]: /data/var/log/apache/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
  network_dirs:
    data.storage:
      - wp-content/uploads/

data.db:
  image: nanobox/mysql

data.storage:
  image: nanobox/unfs
```

For a detailed explanation of each of the WordPress boxfile.yml config settings, view the [WordPress boxfile.yml Explained guide](advanced/boxfile-explained/).


### Update Database Connection in wp-config.php
In order for WordPress to connect to its database, you'll need your database connection credentials to use environment variables that will be automatically generated when your app is built and deployed.

These environment variables are generated using ID of your database component. With an ID of `data.db`, environment variable keys will be created with `DATA_DB_` and the credential title. Below is what the db config will should look like:

```php?start_inline=1
/** The name of the database for WordPress */
define('DB_NAME', 'gonano');

/** MySQL database username */
define('DB_USER', $_ENV['DATA_DB_USER']);

/** MySQL database password */
define('DB_PASSWORD', $_ENV['DATA_DB_PASS']);

/** MySQL hostname */
define('DB_HOST', $_ENV['DATA_DB_HOST']);
```

**Note:** *Databases created on Nanobox will always have the name "gonano".*

### Setup Auth Keys & Salts
WordPress uses authentication keys and salts to securely create sessions. If these don't exist, WordPress will automatically create and reference them in the database, so they don't need to be defined when developing locally.

However, for security purposes, auth keys and salts should be explicitly defined in a production environment, but never committed to your codebase. Instead, you can use environment variables. Replace the auth key and salts definitions in your wp-config.php with the following:

```php?start_inline=1
define('AUTH_KEY',         $_ENV['AUTH_KEY']         ?: '');
define('SECURE_AUTH_KEY',  $_ENV['SECURE_AUTH_KEY']  ?: '');
define('LOGGED_IN_KEY',    $_ENV['LOGGED_IN_KEY']    ?: '');
define('NONCE_KEY',        $_ENV['NONCE_KEY']        ?: '');
define('AUTH_SALT',        $_ENV['AUTH_SALT']        ?: '');
define('SECURE_AUTH_SALT', $_ENV['SECURE_AUTH_SALT'] ?: '');
define('LOGGED_IN_SALT',   $_ENV['LOGGED_IN_SALT']   ?: '');
define('NONCE_SALT',       $_ENV['NONCE_SALT']       ?: '');
```

When you [deploy Wordpress](/wordpress/deploy-wordpress/), you can define these variables in your live environment.

## Up and Running
With your boxfile.yml in place and your wp-config.php updated, you're ready to get WordPress up and running in your dev environment.


```bash
# build the code
nanobox build

# start the dev environment and deploy your build
nanobox dev deploy

# add a convenient way to access your app from the browser
nanobox dev dns add wordpress.nanobox.dev

# start PHP-FPM and Apache
nanobox dev run
```

You can visit your running WordPress app at `wordpress.nanobox.dev:8080`.

## Now What?
Now that you have WordPress running on Nanobox, what's next? Hopefully the topics below will help you get started with the next steps of your development!

[Importing Data](data-storage-management/importing-data/)  
[Importing Uploads](data-storage-management/importing-uploads/)  
[Installing & Updating Plugins & Themes](plugins-themes/)  
[Deploying Wordpress](deploy-wordpress/)
