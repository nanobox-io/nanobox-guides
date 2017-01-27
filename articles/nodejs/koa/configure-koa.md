# Configure Koa for Production

## Setup a webserver
Koa runs best in production with a reverse-proxy setup. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into koa through node's builtin server.

#### Nginx
Add the following to your `boxfile.yml` to make nginx available to the runtime:

```yaml
run.config:
  # add nginx package
  extra_packages:
    - nginx
```

Now add the following nginx config file into your project, at `config/nginx.conf`:

<div class="meta" data-class="configFile" data-run="config/nginx.conf"></div>

```nginx
worker_processes 1;
daemon off;

events {
    worker_connections 1024;
}

http {
    sendfile on;

    gzip              on;
    gzip_http_version 1.0;
    gzip_proxied      any;
    gzip_min_length   500;
    gzip_disable      "MSIE [1-6]\.";
    gzip_types        text/plain text/xml text/css
                      text/comma-separated-values
                      text/javascript
                      application/x-javascript
                      application/atom+xml;

    # Proxy upstream to the node process
    upstream koa {
        server 127.0.0.1:1337;
    }

    # Configuration for Nginx
    server {

        # Listen on port 8080
        listen 8080;

        root /app/public;

        try_files $uri/index.html $uri @koa;

        # Proxy connections to koa
        location @koa {
            proxy_pass         http://koa;
            proxy_redirect     off;
            proxy_set_header   Host $host;
        }
    }
}
```

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/boxfile/web/). There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io/boxfile/worker/).

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
# add a web component and give it a "start" command
web.main:
  start:
    nginx: nginx -c /app/config/nginx.conf
    koa: koa lift
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

#### Specify worker components
You can have as many worker components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
# add a worker component and give it a "start" command
worker.main:
  start: node YOUR WORKER
```

In the above snippet `main` is the name of the worker component and can be anything you choose (it is only used as a unique identifier).

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Compile Assets
We can have koa compile assets during the deploy process by adding an extra step:

```yaml
deploy.config:
  extra_steps:
    - COMMAND TO COMPILE ASSETS
```

## Migrate Data
To migrate data as part of the deploy process you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
Run a task each time we deploy. In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  before_live:
    web.main:
      - COMMAND TO MIGRATE DB
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/nodejs/koa/preview-your-app)
* [Launch your App](/nodejs/koa/launch-your-app)
* [Back to koa overview](/nodejs/koa)
