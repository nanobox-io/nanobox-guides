# Configure Nette for Production

## Setup webserver
Nette runs best in production with a reverse-proxy setup. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into php through php-fpm.

#### Nginx

Add the following to you `boxfile.yml` to make the php engine setup and configure the webserver as nginx:

```yaml
run.config:
  engine.config:
    # use nginx
    webserver: nginx

    # public directory
    document_root: www

    # index
    nginx_default_gateway: index.php
```

## Add a web
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/boxfile/web/).

#### Specify a web component
You can add a web components in your `boxfile.yml`:

```yaml
web.main:
  start: php-server
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

## Add Writable Directories
By default, webs and workers run in a read only environment. Nette will need certain directories available for caching.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:
  # add writable dirs to your web component
  writable_dirs:
    - log
    - temp
```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Streaming Logs
if you want Nette to stream logs to the nanobox dashboard we'll need to add a `log_watch` path to the boxfile:

```yaml
web.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    nette[error]: /app/log/nette.log
    nette[exception]: /app/log/exception.log

worker.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    nette[error]: /app/log/nette.log
    nette[exception]: /app/log/exception.log
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/php/nette/preview-your-app)
* [Launch your App](/php/nette/launch-your-app)
* [Back to nette overview](/php/nette)
