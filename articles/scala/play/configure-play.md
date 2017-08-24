# Configure Play for Production

## Setup a webserver
Play runs best in production with a reverse-proxy setup. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into play.

#### Nginx
Add the following to your `boxfile.yml` to make nginx available to the runtime:

```yaml
run.config:
  
  # ...
  
  engine.config:
    extra_package_dirs:
      - etc
  
  # add nginx package
  extra_packages:
    - nginx
```

#### Nginx configuration
Now add the following nginx configuration into your project, at `etc/nginx.conf`:

<div class="meta" data-class="configFile" data-run="etc/nginx.conf"></div>

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

    # Proxy upstream to the scala process
    upstream play {
        server 127.0.0.1:9000;
    }

    # Configuration for Nginx
    server {

        # Listen on port 8080
        listen 8080;

        root /app/public;
        
        try_files $uri/index.html $uri @play;

        # Proxy connections to play
        location @play {
            proxy_pass         http://play;
            proxy_redirect     off;
            proxy_set_header   Host $host;
        }
    }
}
```

## Add web
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/boxfile/web/).

#### sbt-native-packager

The Scala engine assumes [sbt-native-packager](https://github.com/sbt/sbt-native-packager/blob/master/README.md) is configured, and will use the plugin to generate the runnable application. Fortunately, Play sets this up by default so there is no need for additional configuration.

When the application is built, Nanobox will package up the compiled application from the generated stage, and your application will be available within `bin/<name-of-your-app>`

#### Specify the web component
You can add a web component to your existing `boxfile.yml`:

```yaml
# add a web component and give it a "start" command
web.main:
  start: 
    nginx: nginx -c /app/etc/nginx.conf
    play: bin/<name-of-your-app> -Dhttp.port=9000

```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

## Add Writable Directories
By default, webs run in a read only environment. Your Play app will need certain directories to be writable. In fact, since Scala is a compiled language and isn't prone to executing foreign scripts, it's generally easiest to make the entire app writable:

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.main:
  
  # ...
  
  # add writable dirs to your web component
  writable_dirs:
    - "."

```

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Streaming Logs
If Play logs to custom file and you want to stream those logs to the nanobox dashboard, we'll need to add a `log_watch` path to the boxfile:

```yaml
web.main:
  
  # ...
  
  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    play: 'log/custom.log'

```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Compile Assets
If Play needs to compile or generate assets during a deploy, you can add an extra step:

```yaml
deploy.config:
  
  # ...
  
  extra_steps:
    - <command-to-compile-assets>
```

## Migrate Data
To migrate data as part of the deploy process you can add a `before_live` hook, which will run just before the new instances are started.

#### Add a deploy hook
Run a task each time we deploy. In your existing boxfile.yml add the following code:

```yaml
deploy.config:
  
  # ...
  
  before_live:
    web.main:
      - <command-to-migrate-data>
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/scala/play/preview-your-app)
* [Launch your App](/scala/play/launch-your-app)
* [Back to Play overview](/scala/play)
