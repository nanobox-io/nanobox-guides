# Configure Rails for Production
With very little effort you can take your app from a local development app to a full production ready app. Once your app has been configured to run in production not only will it still work locally, but you can then **guarantee** that if the dev environment works it will work in production also.

## Setup webserver
Django runs best in production with a reverse-proxy configuration. Nginx is very fast and very stable. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into rails through puma.

#### Nginx

Add the following to your `boxfile.yml` to make nginx available to the runtime:

```yaml
code.build:
  # to run the app, we'll need nginx as a reverse proxy
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
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components). Up until now we've been running our app by consoling into the dev environment and starting the rails server. In production you'll want this to happen automatically. There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components).

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
# ...

# add a web component and give it a "start" command
web.main:
  start:
    nginx: nginx -c /app/config/nginx.conf
    puma: bundle exec puma -C /app/config/puma.rb
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier). The `start` command will be unique to the web server you're using within your app (unicorn, puma, etc.)

#### Specify worker components
You can have as many worker components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
# ...

# add a worker component and give it a "start" command
worker.main:
  start: sidekiq
```

In the above snippet `main` is the name of the worker component and can be anything you choose (it is only used as a unique identifier). The `start` command will be unique to the background processor you're using within your app (sidekiq, resque, etc.)

## Add Writable Directories
By default, each components container is a read only environment. Rails will need certain directories available to write to for things like log output, temporary files, etc.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:

  # ...

  # add writable dirs to your web component
  writable_dirs:
    - tmp
    - log

worker.main:

  # ...

  # add writable dirs to your worker component
  writable_dirs:
    - tmp
    - log
```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Streaming Logs
Although our app is now able to write it's logs to log files, if want it to stream those logs to the nanobox dashboard we'll need to add a `log_watch` path to the boxfile:

```yaml
web.main:

  # ...

  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    key: 'log/production.log'

worker.main:

  # ...

  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    key: 'path/to/log.file'
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Compile Assets
For Rails to run in production we'll need to compile all of our assets. To do that you can update your existing `boxfile.yml` with an after_compile [hook]():

```yaml
code.build:
  
  # ...

  after_compile:
    - rake assets:precompile
```

## Migrate Data
The last step is to prepare any databases you might need. Just as you might `rake db:setup` locally, you'll need to have nanobox do that with each deploy incase you're modifying data with migrations as part of the deploy.

#### Add a deploy hook
Nanobox can run hooks at different points in the development process. We'll want to tell nanobox to run a special rake task each time we deploy. In your existing boxfile.yml add the following code:

```yaml
# ...

code.deploy:
  before_deploy:
    web.main:
      - rake db:setup_or_migrate
```

#### Add a rake task
You'll need to add a custom rake task that will either setup your database on first deploy, or run migrations for subsequent deploys. You could, for example, create a `lib/tasks/db.rake` file that contained the following:

```ruby
namespace :db do
  desc 'either sets up the db or migrates it depending on state of db'
  task setup_or_migrate: :environment do
    begin
      ActiveRecord::Base.connection
    rescue ActiveRecord::NoDatabaseError
      Rake::Task["db:setup"].invoke
    else
      Rake::Task["db:migrate"].invoke
    end
  end
end
```

**NOTE:** Your rake task may need to be modified to fit the database you're using.

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Stage your App](/ruby/rails/stage-your-app)
* [Launch your App](/ruby/rails/launch-your-app)
* [Back to rails overview](/ruby/rails)
