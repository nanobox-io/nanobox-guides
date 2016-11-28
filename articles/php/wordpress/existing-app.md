# Starting with an Existing WordPress App

Part of what makes Nanobox so useful is you don't have to have PHP, Apache, etc., installed on your local machine to run WordPress. This guide walks through creating a simple WordPress app from scratch with Nanobox.

The processed outlined in this guide was the same used to create the [nanobox-wordpress](https://github.com/nanobox-quickstarts/nanobox-wordpress) quickstart found under [nanobox-quickstarts](https://github.com/nanobox-quickstarts) on Github.

*If you don't have an existing WordPress project, the [WordPress from Scratch guide](/php/wordpress/from-scratch) is where you should start.*

## Prepare Your Codebase
There are a few modifications you need make to WordPress to allow your app to connect to your database and create secure sessions.

### Add a boxfile.yml
The [boxfile.yml](https://docs.nanobox.io/boxfile/) tells Nanobox how to build and configure your environment. Create a `boxfile.yml` at the root of your project that contains the following:

*For a detailed explanation of each of the WordPress boxfile.yml settings, view the [WordPress boxfile.yml Explained guide](advanced/boxfile-explained).*

```yaml
run.config:
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

#### Important Note About PHP Version
While PHP 7.0 is recommended because of its performance improvements, you should stick with whatever PHP version your app was previously using.

MySQL cyphers changed between PHP 5 and PHP 7. If your app was created using PHP 5.x, you must go through a proper WordPress-from-PHP5-to-PHP7 migration process before you can use PHP 7.0. Otherwise your app won't be able to connect to its database.

### Update Database Connection in wp-config.php
For WordPress to connect to its database, you need update your database connection credentials to use environment variables that will be automatically generated when your app is built and deployed.

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

*Generating these environment variables is covered in the [Deploy Wordpress](/php/wordpress/deploy-wordpress) guide.*

## Create a WordPress Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside it. From within this environment you can run the app and perform other tasks as you would normally.

With your boxfile.yml in place and your wp-config.php updated, you're ready to get WordPress up and running in your dev environment.


```bash
# start the dev environment
nanobox dev start

# add a convenient way to access your app from the browser:
nanobox dev dns add wordpress.nanobox.dev

# start PHP-FPM and Apache
nanobox dev run
```

You can visit your running WordPress app at `wordpress.nanobox.dev`.

## Now What?
Now that you have WordPress running with Nanobox, what's next? Hopefully the topics below will help you get started with the next steps of your development!

[Importing Data](/php/wordpress/data-storage-management/importing-data)  
[Importing Uploads](/php/wordpress/data-storage-management/importing-uploads)  
[Installing & Updating Plugins](/php/wordpress/installing-updating-plugins)  
[Installing & Updating Themes](/php/wordpress/installing-updating-themes)  
[Deploying Wordpress](/php/wordpress/deploy-wordpress)
