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
