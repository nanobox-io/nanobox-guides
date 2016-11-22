# Configure Slim for Production

## Add a web
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components).

#### Specify a  web component
You can add a web components in your `boxfile.yml`:

```yaml
web.main:
  start:
    nginx: start-apache
    fpm: start-php
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

## Add Writable Directories
By default, webs run in a read only environment. You may need certain directories writable.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:
  # add writable dirs to your web component
  writable_dirs:
    - tmp/cache
```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Streaming Logs
if you want Slim to stream logs to the nanobox dashboard we'll need to add a `log_watch` path to the boxfile:

```yaml
web.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    apache[access]: /data/var/log/apache/access.log
    apache[error]: /data/var/log/apache/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Add Storage Component

You might also need certain directories to be shared among all slim instances. We can do this easily with nanobox by adding a storage data component:

```yaml
run.config:
  network_dirs:
    data.storage:
      - path/to/shared/directory

data.storage:
  image: nanobox/unfs
```

## Migrate Data
To migrate data as part of the deploy process you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  before_live:
    web.main:
      - php index.php migrate
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/php/slim/preview-your-app)
* [Launch your App](/php/slim/launch-your-app)
* [Back to slim overview](/php/slim)
