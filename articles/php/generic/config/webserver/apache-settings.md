# Apache Settings

The following settings are used to configure Apache. These only apply when using `apache` as your `webserver`.

```yaml
code.build:
  engine: php
  config:
    webserver: apache
```

**Note:** *Apache is the default webserver used by the PHP engine, so you don't need to include it in your boxfile.yml*.

### apache\_document\_root
The public root of your web application. For instance, if you like to house your app in `/public` for security or organizational purposes, you can specify that here. The default is the `/`.

**Note:** If both this setting and the [global `document_root`](/php/config/webserver/webserver-settings.html#document_root) are set, the `apache_document_root` will take precedence.

```yaml
code.build:
  config:
    apache_document_root: '/'
```

### apache\_index\_list
When a path is not specified in the url, these files are served in order in which they're listed.

```yaml
code.build:
  config:
    apache_index_list:
      - index.php
      - index.html
```

### apache\_default\_gateway
When a path is not specified in the url, this files is served. *This is similar to [`apache_index_list`](#apache_index_list) except it only accepts a single argument.*

```yaml
code.build:
  config:
    apache_default_gateway: "index.php"
```

### apache\_php\_interpreter

Specify which PHP interpreter you would like Apache to use.

- php_fpm *(default)*
- mod_php

```yaml
code.build:
  config:
    apache_php_interpreter: php_fpm
```

### apache_modules

Specify which Apache modules to enable or disable. View the [full list of available Apache Modules](https://github.com/nanobox-io/nanobox-engine-php/blob/master/doc/apache-modules.md). By default, all modules are enabled.

```yaml
code.build:
  config:
    apache_modules
```

### apache\_max\_spares

Sets Apaches [`MaxSpareServers` directive](http://httpd.apache.org/docs/2.2/mod/prefork.html#maxspareservers).

```yaml
code.build:
  config:
    apache_max_spares: 10
```

### apache\_max\_clients
Sets Apache's [`MaxClients` directive](http://httpd.apache.org/docs/2.2/mod/mpm_common.html#maxclients). **Note:** This configuration must be less than or equal to the [`apache_server_limit`](#apache_server_limit).

```yaml
code.build:
config:
apache_max_clients: 128
```

### apache\_server\_limit
Sets Apaches [`ServerLimit` directive](http://httpd.apache.org/docs/2.2/mod/mpm_common.html#serverlimit). **Note:** This configuration must be greater than or equal to the [`apache_max_clients`](#apache_max_clients).

```yaml
code.build:
  config:
    apache_server_limit: 128
```

### apache\_max\_requests
Sets Apache's [`MaxRequestsPerChild` directive](http://httpd.apache.org/docs/2.2/mod/mpm_common.html#maxrequestsperchild).

```yaml
code.build:
  config:
    apache_max_requests: 10000
```

### apache\_static\_expire
Adds far future expires to your header, setting the number of seconds static assets are cached. By default, static asset caching is not enabled. We only recommend using this directive on apps whose static assets do not change often.

```yaml
code.build:
  config:
    apache_static_expire: 86400
```

### apache\_log\_level
Sets Apache's [`LogLevel` directive](http://httpd.apache.org/docs/2.2/mod/core.html#loglevel).

```yaml
code.build:
  config:
    apache_log_level: warn
```

### apache\_access\_log
Enables or disables the Apache Access log.

```yaml
code.build:
  config:
    apache_access_log: false
```
