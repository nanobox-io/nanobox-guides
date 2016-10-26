# Composer

The [PHP Engine](https://github.com/nanobox-io/nanobox-engine-php) includes composer and makes the `composer` executable available from your console.

```bash
# Console into your dev container
nanobox dev console

# Run composer commands
composer install
```

## Composer Runs During Build
When building your runtime, the PHP engine checks for a `composer.json` file and, if it exists, runs `composer install` to load your composer packages.

```bash
# Build your runtime
nanobox build

# As your runtime is built, Nanobox looks for a composer.json.
# If it exists, it will run `composer install`
```

## Composer & PHP Extensions
The PHP extensions required by Composer are pre-installed by the PHP engine. However, when loading some dependencies, other extensions may be required. PHP Extensions can be enabled in your boxfile.yml.

```yaml
code.build:
  engine: php
  config:
    extensions:
      - zip
      - hash
      - pdo
```

The [Extensions guide](/php/extensions) lists all extensions available for each PHP version.
