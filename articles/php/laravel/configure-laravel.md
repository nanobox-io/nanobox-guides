# Configure Laravel for Production

## Setup webserver
Laravel runs best in production with a reverse-proxy setup. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into php through php-fpm.

#### Nginx

Add the following to you `boxfile.yml` to make the php engine setup and configure the webserver as nginx:

```yaml
run.config:
  engine.config:
    webserver: nginx
```

Also we'll need to tell nginx where Laravel's document root is:

```yaml
run.config:
  engine.config:
    document_root: public
```

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components). There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components).

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
web.main:
  start:
    nginx: start-nginx
    fpm: start-php
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

#### Specify worker components
You can have as many worker components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
worker.main:
  start: 'php artisan queue:work --queue=default --daemon --tries=5'
```

## Add Writable Directories
By default, webs and workers run in a read only environment. Laravel will need certain directories available for caching.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:
  # add writable dirs to your web component
  writable_dirs:
    - bootstrap/cache

worker.main:
  # add writable dirs to your worker component
  writable_dirs:
    - bootstrap/cache
```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Streaming Logs
If want Laravel to stream logs to the nanobox dashboard we'll need to add a `log_watch` path to the boxfile:

```yaml
web.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    nginx[access]: /data/var/log/nginx/access.log
    nginx[error]: /data/var/log/nginx/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
    laravel[error]: /app/storage/logs/laravel.log

worker.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    php[error]: /data/var/log/php/php_error.log
    laravel[error]: /app/storage/logs/laravel.log
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Add Storage Component

Laravel will need the `storage` directory to be shared among all laravel instances. We can do this easily with nanobox by adding a storage data component:

```yaml
web.main:
  network_dirs:
    data.storage:
      - storage

data.storage:
  image: nanobox/unfs
```

## Migrate Data
To migrate data, and ensure the storage directories exist as part of the deploy process you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  before_live:
    web.main:
      - php artisan migrate --force
      - mkdir -p storage/framework/{sessions,cache,views}
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/php/laravel/preview-your-app)
* [Launch your App](/php/laravel/launch-your-app)
* [Back to laravel overview](/php/laravel)
