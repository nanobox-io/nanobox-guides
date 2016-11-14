# Configure Sinatra for Production

## Setup webserver
Sinatra runs best in production with a reverse-proxy setup. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into sinatra through puma.

#### Nginx
Add the following to your `boxfile.yml` to make nginx available to the runtime:

```yaml
run.config:
  # add nginx package
  extra_packages:
    - nginx
```

Now add the following nginx config file into your project, at `config/nginx.conf`:

<div class="meta" data-method="configFile" data-params="config/nginx.conf"></div>

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

    # Proxy upstream to the puma process
    upstream sinatra {
        server 127.0.0.1:3000;
    }

    # Configuration for Nginx
    server {

        # Listen on port 8080
        listen 8080;

        root /app/public;

        try_files $uri/index.html $uri @sinatra;

        # Proxy connections to sinatra
        location @sinatra {
            proxy_pass         http://sinatra;
            proxy_redirect     off;
            proxy_set_header   Host $host;
        }
    }
}
```

#### Puma
Add puma to your Gemfile (if it's not already):

```ruby
gem 'puma', '~> 3.0'
```

Now add the following puma config file into your project, at `config/puma.rb`:

<div class="meta" data-method="configFile" data-params="config/puma.rb"></div>

```ruby
# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("SINATRA_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests, default is 3000.
#
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory. If you use this option
# you need to make sure to reconnect any threads in the `on_worker_boot`
# block.
#
# preload_app!

# The code in the `on_worker_boot` will be called if you are using
# clustered mode by specifying a number of `workers`. After each worker
# process is booted this block will be run, if you are using `preload_app!`
# option you will want to use this block to reconnect to any threads
# or connections that may have been created at application boot, Ruby
# cannot share connections between processes.
#
# on_worker_boot do
#   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
# end

```

**IMPORTANT**: The puma configuration above is a minimal configuration sufficient to run your app. We will cover advanced configuration tuning in a later guide.

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components). There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components).

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
# add a web component and give it a "start" command
web.main:
  start:
    nginx: nginx -c /app/config/nginx.conf
    puma: bundle exec puma -C /app/config/puma.rb
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

#### Specify worker components
You can have as many worker components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
# add a worker component and give it a "start" command
worker.main:
  start: ruby myworker.rb
```

In the above snippet `main` is the name of the worker component and can be anything you choose (it is only used as a unique identifier).

## Add Writable Directories
By default, webs and workers run in a read only environment. Your Sinatra app may need certain directories to be writable.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:
  # add writable dirs to your web component
  writable_dirs:
    - tmp

worker.main:
  # add writable dirs to your worker component
  writable_dirs:
    - tmp
```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Streaming Logs
If you Sinatra logs to custom file and you want to stream those logs to the nanobox dashboard, we'll need to add a `log_watch` path to the boxfile:

```yaml
web.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    sinatra: 'log/custom.log'

worker.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    worker: 'path/to/worker/log.file'
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Compile Assets
If Sinatra needs to compile or generate assets during a deploy, you can add an extra step:

```yaml
deploy.config:
  extra_steps:
    - rake YOUR RAKE TASK
```

## Migrate Data
To migrate data as part of the deploy process you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
Run a rake task each time we deploy. In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  before_live:
    web.main:
      - rake YOUR MIGRATION TASK
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Stage your App](/ruby/sinatra/stage-your-app)
* [Launch your App](/ruby/sinatra/launch-your-app)
* [Back to sinatra overview](/ruby/sinatra)
