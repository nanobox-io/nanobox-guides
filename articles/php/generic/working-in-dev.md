# Working in Dev
Nanobox provides a local virtualized development environment in which to craft your PHP app. Your local codebase is mounted into your dev environment, so any code changes will be reflected in your running dev app. The following will get your dev environment up and running and give your app a DNS alias to run from.

```bash
# start your dev environment
nanobox dev start

# provide a convenient way to access
# your app from the browser
nanobox dev dns add appname.dev
```

After [starting your webserver](#starting-your-webserver), your app will be available at `appname.dev:8080`.

## Starting Your Webserver
You have a few options for starting PHP and your webserver.

### Run All Start Commands
The `nanobox dev run` command will run all web and worker start commands specified in your boxfile.yml. This is the recommended method when you have more than one start command.

```yaml
# run all web and worker start commands
nanobox dev run
```

### Console In
You can also console into your dev environment and manually start your web server. This is recommended when you have only one start command and/or want to run start command(s) different than those specified in your boxfile.yml.

```bash
# console into dev
nanobox dev console

# start apache (using mod-php)
start-apache
```

## Disable Bytecode Cachers
Bytecode cachers (APC, EAccelerator, xCache and OPcache) provide significant performance boosts, but you don't want them enabled while in development. They will cache your PHP responses and pull future responses only from the cache. This will prevent changes to files from propagating to your running app.

The PHP engines allows you to remove certain extensions while in dev using the [`dev_extenesions`](/php/config/php-settings.html#dev_extensions) and [`dev_zend_extenesions`](/php/config/php-settings.html#dev_zend_extensions) options.

```yaml
code.build:
  engine: php
  config:
    extensions:
      - mysqli
      - xcache
    dev_extensions:
      rm:
        - xcache
```
