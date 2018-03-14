# Composer

The [PHP Engine](https://github.com/nanobox-io/nanobox-engine-php) includes composer and makes the `composer` executable available from your console. The PHP engine checks for a `composer.json` file and, if found, runs `composer install` to load your composer packages.

```bash
# Drop into a nanobox console
nanobox run

# Run composer commands
composer SUB COMMAND

# exit the console
exit
```

## Composer Install Command
By default, the PHP engine will runs `composer install --prefer-source --no-interaction`, but you can customize the command with the `composer_install` boxfile.yml config.

#### composer_install
```yaml
run.config:
  engine: php
  engine.config:
    composer_install: 'composer install --no-interaction --prefer-source'
```
