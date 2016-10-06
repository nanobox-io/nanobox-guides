# PHP: Getting Started

Creating a PHP environment and app with Nanobox is done in a few simple steps.

1. [Add a boxfile.yml](#add-a-boxfile-yml)
2. [Configure PHP](#configure-php)
3. [Up and Running](#up-and-running)

## Add a boxfile.yml
The [`boxfile.yml`](https://docs.nanobox.io/boxfile/) is a yaml config file used to configure your app's runtime and environment. It should be added to the root of your project.

### Specify the PHP Engine
In your boxfile.yml, you'll need to set your `engine` to `php`. [Engines](https://docs.nanobox.io/engines) define your code's runtime environment. The PHP engine will install PHP and associated executables for you.

```yaml
code.build:
  engine: php
```

## Configure PHP
All the configuration that would typically be done in your `php.ini` is handled through your boxfile.yml. The PHP engine automatically builds your `php.ini` based on settings specified in your boxfile.yml.

```yaml
code.build:
  engine: php
  config:
    runtime: php-7.0
    extensions:
      - curl
      - mysql
    webserver: apache
```

All PHP configuration options are detailed in the [Config Options guides](/php/config/overview).

## Up and Running
With your boxfile.yml in place, you're ready to build your runtime, start your development environment (dev), and console in.

```yaml
# build your runtime
nanobox build

# start your dev environment and console in
nanobox dev console
```

This will drop you into an interactive console inside your virtualized dev environment on your local machine. You can [run Composer](composer.html) or [start your webserver](#). Your local codebase is mounted into your dev container so any changes made to your code will apply to your dev environment.
