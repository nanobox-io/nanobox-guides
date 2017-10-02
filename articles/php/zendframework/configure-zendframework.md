# Configure Zend Framework for Production

_**PLACEHOLDER:** This whole guide is essentially placeholder content and needs to be replaced with Zend Framework-specific content._

## Setup webserver
_**PLACEHOLDER:** Add information about about adding a webserver for Zend Framework. Apache vs Nginx?_

#### Nginx

Add the following to you `boxfile.yml` to make the php engine setup and configure the webserver as nginx:

```yaml
run.config:
  engine.config:
    # use nginx
    webserver: nginx

    # public directory
    document_root: web

    # index
    nginx_default_gateway: app.php
```

## Add a web
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/boxfile/web/).

#### Specify a Web Component
You can add a web components in your `boxfile.yml`:

```yaml
web.main:
  start:
    php: start-php
    nginx: start-nginx
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

## Add Writable Directories
By default, webs and workers run in a read only environment. Zend Framework will need certain directories available for caching.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:
  # add writable dirs to your web component
  writable_dirs:
    - var
```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Streaming Logs
if you want Zend Framework to stream logs to the nanobox dashboard we'll need to add a `log_watch` path to the boxfile:

```yaml
web.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    zendframework[error]: /app/storage/logs/zendframework.log

worker.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    zendframework[error]: /app/storage/logs/zendframework.log
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Migrate Schema
To migrate your schema you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  before_live:
    web.main:
      - php bin/console doctrine:schema:update --force
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/php/zendframework/preview-your-app)
* [Launch your App](/php/zendframework/launch-your-app)
* [Back to Zend Framework overview](/php/zendframework)
