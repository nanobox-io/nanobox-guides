# Configure Phalcon for Production

## Setup webserver
Phalcon runs best in production with a reverse-proxy setup. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into php through php-fpm.

#### Nginx

Add the following to you `boxfile.yml` to make the php engine setup and configure the webserver as nginx:

```yaml
run.config:
  engine.config:
    # use apache
    webserver: nginx

    # public directory
    document_root: public
```

## Add a web
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/boxfile/web/).

#### Specify a web component
You can add a web components in your `boxfile.yml`:

```yaml
web.main:
  start:
    php: start-php
    nginx: start-nginx
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

## Add Writable Directories
By default, webs and workers run in a read only environment. Phalcon will need certain directories available for caching. Writable directories are stored in each instance's local filesystem and do not persist between deploys. *For things that should be shared between instances and persist between deploys you should use [network directories](#add-network-direcories).

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:
  # add writable dirs to your web component
  writable_dirs:
    - cache
```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Network directories
Network directories provide persistent file storage for directories that need writable permissions (They're great for things such as uploads). The contents of network directories are stored on a separate "storage" component and then mounted into each of your web/worker nodes.

```yaml
web.main:
  # add network directories to your component
  network_dirs:
    data.storage:
      - path/to/dirA
      - path/to/dirB

# Add a storage component on which to store network_dirs
data.storage:
  image: nanobox/unfs:0.9
```

## Add Streaming Logs
If you want Phalcon to stream custom logs to your Nanobox dashboard, can add a `log_watch` path to your boxfile.yml:

```yaml
web.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    phalcon[error]: path/to/phalcon-error.log
    generic[error]: path/to/generic-error.log

worker.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:    
    worker[error]: path/to/worker.log
    worker[queue]: path/to/queue.log
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Database Migrations
To run database migrations on deploy, you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  before_live:
    web.main:
      - phalcon run-migration
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/php/phalcon/preview-your-app)
* [Launch your App](/php/phalcon/launch-your-app)
* [Back to Phalcon overview](/php/phalcon)
