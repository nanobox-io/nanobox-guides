# General Webserver Settings

The following setting is used to select which web server to use in your application.

### webserver
The following web servers are available:

- apache *(default)*
- nginx
- builtin ([PHP's built-in web server](http://php.net/manual/en/features.commandline.webserver.php) available in 5.4+)

```yaml
run.config:
  config:
    webserver: 'apache'
```

*Webserver-specific settings are available in the [Apache Settings](/php/apache-settings), [Nginx Settings](/php/nginx-settings), & [Built-In PHP Web Server Settings](/php/builtin-settings) guides.*

### document_root
The public root of your web application. For instance, if you like to house your app in `/public` for security or organizational purposes, you can specify that here. The default is the `/`.

```yaml
run.config:
  config:
    document_root: '/'
```
