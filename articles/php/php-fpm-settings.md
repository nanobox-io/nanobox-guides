# PHP-FPM Settings

These settings only apply when using `php_fpm` as your `apache_php_interpreter`.

### php\_fpm\_events\_mechanism
Sets `events.mechanism` setting in the `php-fpm.conf` which specifies the events mechanism FPM will use. More information is available in [PHP's documentation](http://php.net/manual/en/install.fpm.configuration.php#events-mechanism).

```yaml
run.config:
  config:
    php_fpm_events_mechanism: 'epoll'
```

### php\_fpm\_max\_children
Sets the maximum number of child processes that can be created by PHP.

```yaml
run.config:
  config:
    php_fpm_max_children: 20
```

### php\_fpm\_max\_spare\_servers
The desired maximum number of idle server processes.

```yaml
run.config:
  config:
    php_fpm_max_spare_servers: 1
```

### php\_fpm\_max\_requests
Sets the number of requests each child process should execute before respawning. This can be useful to work around memory leaks in 3rd party libraries.

```yaml
run.config:
  config:
    php_fpm_max_requests: 128
```
