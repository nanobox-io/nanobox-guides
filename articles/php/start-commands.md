# Start Commands

There are many different options for starting a PHP web service and which one you should use depends on what web server and PHP interpreter you're using. This guide provides start commands for each of the possibilities as well as [log_watches](https://docs.nanobox.io/app-config/app-logs/) necessary to include the appropriate logs in your app's log stream.

## Apache
The following start commands should be used when your [`webserver`](../web-server-settings/#webserver) is set to `apache`.

### PHP-FPM
The following start commands and log\_watches should be used if your [`apache_php_interpreter`](../web-server-settings/apache/#apache_php_interpreter) is set to `php_fpm`.

```yaml
web.site:
  start:
    fpm: start-php
    apache: start-apache
  log_watch:
    apache[access]: /data/var/log/apache/access.log
    apache[error]: /data/var/log/apache/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
```

### mod_php
The following start commands and log\_watches should be used if your [`apache_php_interpreter`](../web-server-settings/apache/#apache_php_interpreter) is set to `mod_php`.

```yaml
web.site:
  start: start-apache
  log_watch:
    apache[access]: /data/var/log/apache/access.log
    apache[error]: /data/var/log/apache/error.log
    php[error]: /data/var/log/php/php_error.log
```

## Nginx
The following start commands and log\_watches should be used when your [`webserver`](../web-server-settings/#webserver) is set to `nginx`.

```yaml
web.site:
  start:
    fpm: start-php
    nginx: /data/sbin/nginx
  log_watch:
    nginx[access]: /data/var/log/nginx/access.log
    nginx[error]: /data/var/log/nginx/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
```

## Built-In
The following start command and log\_watches should be used when your [`webserver`](../web-server-settings/#webserver) is set to `builtin.`

```yaml
web.site:
  start: start-php
  log_watch:
    php[access]: /data/var/log/php/access.log
    php[error]: /data/var/log/php/php_error.log
```
