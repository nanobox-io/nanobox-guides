# Configure Rails for Production

## Setup a webserver
Rails runs best in production with a reverse-proxy setup. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into rails through puma.

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
    include /data/etc/nginx/mime.types;
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
    upstream rails {
        server 127.0.0.1:3000;
    }

    # Configuration for Nginx
    server {

        # Listen on port 8080
        listen 8080;

        root /app/public;

        try_files $uri/index.html $uri @rails;

        # Proxy connections to rails
        location @rails {
            proxy_pass         http://rails;
            proxy_redirect     off;
            proxy_set_header   Host $host;
        }
    }
}
```

#### Puma
Add puma to your `Gemfile`:

```ruby
gem 'puma', '~> 3.0'
```

Now add the following puma config file into your project, at `config/puma.rb`:

<div class="meta" data-class="configFile" data-run="config/puma.rb"></div>

```ruby
# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
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

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

```

**IMPORTANT**: The puma configuration above is a minimal configuration sufficient to run your app. We will cover advanced configuration tuning in a later guide.

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/boxfile/web/). There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io/boxfile/worker/).

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
  start: sidekiq
```

In the above snippet `main` is the name of the worker component and can be anything you choose (it is only used as a unique identifier).

## Add Writable Directories
By default, webs and workers run in a read only environment. Rails will need certain directories available to write to for things like log output, temporary files, etc.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:
  # add writable dirs to your web component
  writable_dirs:
    - tmp
    - log

worker.main:
  # add writable dirs to your worker component
  writable_dirs:
    - tmp
    - log
```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Streaming Logs
Although our app is now able to write it's logs to log files, if you want it to stream those logs to the nanobox dashboard we'll need to add a `log_watch` path to the boxfile:

```yaml
web.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    rails: 'log/production.log'

worker.main:
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    sidekiq: 'path/to/sidekiq/log.file'
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Compile Assets
We can have rails compile assets during the deploy process by adding an extra step:

```yaml
deploy.config:
  extra_steps:
    - rake assets:precompile RAILS_ENV=production
```

## Migrate Data
To migrate data as part of the deploy process you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
Run a rake task each time we deploy. In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  before_live:
    web.main:
      - rake db:setup_or_migrate
```

#### Add a rake task
You'll need to add a custom rake task that will either setup your database on first deploy, or run migrations for subsequent deploys. You could, for example, create a `lib/tasks/db.rake` file that contained the following:

<div class="meta" data-class="configFile" data-run="lib/tasks/db.rake"></div>

```ruby
namespace :db do
  desc 'Setup the db or migrate depending on state of db'
  task setup_or_migrate: :environment do
    begin
      if ActiveRecord::Migrator.current_version.nil? || ActiveRecord::Migrator.current_version.zero?
        Rake::Task['db:migrate'].invoke
        Rake::Task['db:seed'].invoke
      end
    rescue ActiveRecord::NoDatabaseError
      Rake::Task['db:setup'].invoke
    else
      Rake::Task['db:migrate'].invoke
    end
  end
end
```

**NOTE:** Your rake task may need to be modified to fit the database you're using.

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/ruby/rails/preview-your-app)
* [Launch your App](/ruby/rails/launch-your-app)
* [Back to rails overview](/ruby/rails)
