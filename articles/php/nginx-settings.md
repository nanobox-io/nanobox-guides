# Nginx Settings

These settings are used to configure Nginx. They only apply when using `nginx` as your `webserver`.

```yaml
code.build:
  engine: php
  config:
    webserver: nginx
```

### nginx\_document\_root
The public root of your web application. For instance, if you like to house your app in `/public` for security or organizational purposes, you can specify that here. The default is the `/`.

**Note:** If both this setting and the [global `document_root`](/php/webserver-settings/#document_root) are set, the `nginx_document_root` will take precedence.

```yaml
code.build:
  config:
    nginx_document_root: '/'
```

### nginx\_index\_list
When a path is not specified in the url, these files are served in order in which they're listed.

```yaml
code.build:
  config:
    nginx_index_list:
      - index.php
      - index.html
```

### nginx\_default\_gateway
When a path is not specified in the url, this files is served. *This is similar to [`nginx_index_list`](#nginx_index_list) except it only accepts a single argument.*

```yaml
code.build:
  config:
    nginx_default_gateway: 'index.php'
```
