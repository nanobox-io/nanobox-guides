# Webserver Configuration

The following web servers are available:

- apache *(default)*
- nginx
- builtin ([PHP's built-in web server](http://php.net/manual/en/features.commandline.webserver.php) available in 5.4+)

```yaml
run.config:
  engine: php
  engine.config:
    webserver: 'apache'
```

## Apache

#### apache_version
Defines which version of Apache to use in your application. The following versions are available:

- 2.2
- 2.4

```yaml
run.config:
  engine: php
  engine.config:
    apache_version: '2.2'
```

#### apache\_document\_root
The public root of your web application. For instance, if you like to house your app in `/public` for security or organizational purposes, you can specify that here. The default is the `/`.

```yaml
run.config:
  engine: php
  engine.config:
    apache_document_root: public
```

#### apache\_index\_list
When a path is not specified in the url, these files are served in order in which they're listed.

```yaml
run.config:
  engine: php
  engine.config:
    apache_index_list:
      - index.php
      - index.html
```

#### apache\_default\_gateway
When a path is not specified in the url, this files is served. *This is similar to [`apache_index_list`](#apache_index_list) except it only accepts a single argument.*

```yaml
run.config:
  engine: php
  engine.config:
    apache_default_gateway: 'index.php'
```

#### apache\_php\_interpreter

Specify which PHP interpreter you would like Apache to use.

- fpm *(default)*
- mod_php

```yaml
run.config:
  engine: php
  engine.config:
    apache_php_interpreter: fpm
```

#### apache_modules

Specify which Apache modules to enable or disable. View the [full list of available Apache Modules](https://github.com/nanobox-io/nanobox-engine-php/blob/master/doc/apache-modules.md). By default, the following modules are loaded:

- dir
- env
- expires
- log_config
- mime
- rewrite
- setenvif
- deflate

The following modules are enabled when using fpm:

- actions
- alias
- fastcgi

```yaml
run.config:
  engine: php
  engine.config:
    apache_modules:
      - dir
      - env
      - expires
      - log_config
      - mime
      - rewrite
      - setenvif
      - deflate
```

#### apache\_max\_spares

Sets Apaches [`MaxSpareServers` directive](http://httpd.apache.org/docs/2.2/mod/prefork.html#maxspareservers).

```yaml
run.config:
  engine: php
  engine.config:
    apache_max_spares: 10
```

#### apache\_max\_clients
Sets Apache's [`MaxClients` directive](http://httpd.apache.org/docs/2.2/mod/mpm_common.html#maxclients). **Note:** This configuration must be less than or equal to the [`apache_server_limit`](#apache_server_limit).

```yaml
run.config:
  engine: php
  engine.config:
    apache_max_clients: 128
```

#### apache\_server\_limit
Sets Apaches [`ServerLimit` directive](http://httpd.apache.org/docs/2.2/mod/mpm_common.html#serverlimit). **Note:** This configuration must be greater than or equal to the [`apache_max_clients`](#apache_max_clients).

```yaml
run.config:
  engine: php
  engine.config:
    apache_server_limit: 128
```

#### apache\_max\_requests
Sets Apache's [`MaxRequestsPerChild` directive](http://httpd.apache.org/docs/2.2/mod/mpm_common.html#maxrequestsperchild).

```yaml
run.config:
  engine: php
  engine.config:
    apache_max_requests: 10000
```

#### apache\_static\_expire
Adds far future expires to your header, setting the number of seconds static assets are cached. By default, static asset caching is not enabled. We only recommend using this directive on apps whose static assets do not change often.

```yaml
run.config:
  engine: php
  engine.config:
    apache_static_expire: 86400
```

#### apache\_log\_level
Sets Apache's [`LogLevel` directive](http://httpd.apache.org/docs/2.2/mod/core.html#loglevel).

```yaml
run.config:
  engine: php
  engine.config:
    apache_log_level: warn
```

#### apache\_access\_log
Enables or disables the Apache Access log.

```yaml
run.config:
  engine: php
  engine.config:
    apache_access_log: false
```

## Nginx

#### nginx\_document\_root
The public root of your web application. For instance, if you like to house your app in `/public` for security or organizational purposes, you can specify that here. The default is the `/`.

**Note:** If both this setting and the [global `document_root`](/php/webserver-settings/#document_root) are set, the `nginx_document_root` will take precedence.

```yaml
run.config:
  engine: php
  engine.config:
    nginx_document_root: public
```

#### nginx\_index\_list
When a path is not specified in the url, these files are served in order in which they're listed.

```yaml
run.config:
  engine: php
  engine.config:
    nginx_index_list:
      - index.php
      - index.html
```

#### nginx\_default\_gateway
When a path is not specified in the url, this files is served. *This is similar to [`nginx_index_list`](#nginx_index_list) except it only accepts a single argument.*

```yaml
run.config:
  engine: php
  engine.config:
    nginx_default_gateway: 'index.php'
```

## Builtin

#### builtin\_document\_root
The public root of your web application. For instance, if you like to house your app in `/public` for security or organizational purposes, you can specify that here. The default is the `/`.

**Note:** If both this setting and the [global `document_root`](/php/webserver-settings/#document_root) are set, the `builtin_document_root` will take precedence.

```yaml
run.config:
  engine: php
  engine.config:
    builtin_document_root: public
```

## PHP-FPM

These settings only apply when using Nginx or when using Apache with `fpm` as the `apache_php_interpreter`.

#### php\_fpm\_events\_mechanism
Sets `events.mechanism` setting in the `php-fpm.conf` which specifies the events mechanism FPM will use. More information is available in [PHP's documentation](http://php.net/manual/en/install.fpm.configuration.php#events-mechanism).

```yaml
run.config:
  engine: php
  engine.config:
    php_fpm_events_mechanism: 'epoll'
```

#### php\_fpm\_max\_children
Sets the maximum number of child processes that can be created by PHP.

```yaml
run.config:
  engine: php
  engine.config:
    php_fpm_max_children: 20
```

#### php\_fpm\_max\_spare\_servers
The desired maximum number of idle server processes.

```yaml
run.config:
  engine: php
  engine.config:
    php_fpm_max_spare_servers: 1
```

#### php\_fpm\_max\_requests
Sets the number of requests each child process should execute before respawning. This can be useful to work around memory leaks in 3rd party libraries.

```yaml
run.config:
  engine: php
  engine.config:
    php_fpm_max_requests: 128
```
