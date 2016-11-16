# Configure Django for Production

## Setup a webserver
Django runs best in production with a reverse-proxy setup. Let's configure nginx to serve static assets directly, handle compression, and proxy connections into django through gunicorn.

#### Nginx
Add the following to your `boxfile.yml` to make nginx available to the runtime:

```yaml
run.config:
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

    # Proxy upstream to the gunicorn process
    upstream django {
        server 127.0.0.1:8000;
    }

    # Configuration for Nginx
    server {

        # Listen on port 8080
        listen 8080;

        # Settings to serve static files
        location ^~ /static/  {
            root /app/static/;
        }

        # Serve a static file (ex. favico)
        # outside /static directory
        location = /favico.ico  {
            root /app/favico.ico;
        }

        # Proxy connections to django
        location / {
            proxy_pass         http://django;
            proxy_redirect     off;
            proxy_set_header   Host $host;
        }
    }
}
```

#### Gunicorn
Gunicorn can be installed via pip:

```bash
# drop into a nanobox console
nanobox run

# install gunicorn
pip install gunicorn

# freeze dependencies
pip freeze > requirements.txt

# exit nanobox
exit
```

Now add the following gunicorn configuration into your project, at `etc/gunicorn.py`:

<div class="meta" data-class="configFile" data-run="etc/gunicorn.py"></div>

```python
# Server mechanics
bind = '0.0.0.0:8000'
backlog = 2048
daemon = False
pidfile = None
umask = 0
user = None
group = None
tmp_upload_dir = None
proc_name = None

# Logging
errorlog = '-'
loglevel = 'info'
accesslog = '-'
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'

#
# Worker processes
#
#   workers - The number of worker processes that this server
#       should keep alive for handling requests.
#
#       A positive integer generally in the 2-4 x $(NUM_CORES)
#       range. You'll want to vary this a bit to find the best
#       for your particular application's work load.
#
#   worker_class - The type of workers to use. The default
#       sync class should handle most 'normal' types of work
#       loads. You'll want to read
#       http://docs.gunicorn.org/en/latest/design.html#choosing-a-worker-type
#       for information on when you might want to choose one
#       of the other worker classes.
#
#       An string referring to a 'gunicorn.workers' entry point
#       or a python path to a subclass of
#       gunicorn.workers.base.Worker. The default provided values
#       are:
#
#           egg:gunicorn#sync
#           egg:gunicorn#eventlet   - Requires eventlet >= 0.9.7
#           egg:gunicorn#gevent     - Requires gevent >= 0.12.2 (?)
#           egg:gunicorn#tornado    - Requires tornado >= 0.2
#
#   worker_connections - For the eventlet and gevent worker classes
#       this limits the maximum number of simultaneous clients that
#       a single process can handle.
#
#       A positive integer generally set to around 1000.
#
#   timeout - If a worker does not notify the master process in this
#       number of seconds it is killed and a new worker is spawned
#       to replace it.
#
#       Generally set to thirty seconds. Only set this noticeably
#       higher if you're sure of the repercussions for sync workers.
#       For the non sync workers it just means that the worker
#       process is still communicating and is not tied to the length
#       of time required to handle a single request.
#
#   keepalive - The number of seconds to wait for the next request
#       on a Keep-Alive HTTP connection.
#
#       A positive integer. Generally set in the 1-5 seconds range.
#

workers = 1
worker_class = 'sync'
worker_connections = 1000
timeout = 30
keepalive = 2

spew = False

#
# Server hooks
#
#   post_fork - Called just after a worker has been forked.
#
#       A callable that takes a server and worker instance
#       as arguments.
#
#   pre_fork - Called just prior to forking the worker subprocess.
#
#       A callable that accepts the same arguments as after_fork
#
#   pre_exec - Called just prior to forking off a secondary
#       master process during things like config reloading.
#
#       A callable that takes a server instance as the sole argument.
#

def post_fork(server, worker):
    server.log.info("Worker spawned (pid: %s)", worker.pid)

def pre_fork(server, worker):
    pass

def pre_exec(server):
    server.log.info("Forked child, re-executing.")

def when_ready(server):
    server.log.info("Server is ready. Spawning workers")

def worker_int(worker):
    worker.log.info("worker received INT or QUIT signal")

    ## get traceback info
    import threading, sys, traceback
    id2name = dict([(th.ident, th.name) for th in threading.enumerate()])
    code = []
    for threadId, stack in sys._current_frames().items():
        code.append("\n# Thread: %s(%d)" % (id2name.get(threadId,""),
            threadId))
        for filename, lineno, name, line in traceback.extract_stack(stack):
            code.append('File: "%s", line %d, in %s' % (filename,
                lineno, name))
            if line:
                code.append("  %s" % (line.strip()))
    worker.log.debug("\n".join(code))

def worker_abort(worker):
    worker.log.info("worker received SIGABRT signal")

```

**IMPORTANT**: The gunicorn configuration above is a minimal configuration sufficient to run your app. We will cover advanced configuration tuning in a later guide.

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components). There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components).

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
web.main:
  start:
    nginx: nginx -c /app/etc/nginx.conf
    django: gunicorn -c /app/etc/gunicorn.py YOUR_DJANGO_APP.wsgi
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

#### Specify worker components
You can have as many worker components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
worker.main:
  start: 'python jobs-worker.py'
```

## Collect static assets
For django to run behind nginx in production, we'll need to ensure the assets get collected from all of the django apps and dropped into the `assets` directory (which was where we told nginx to serve them from).

#### Configure assets
Set the following asset configuration within `settings.py`:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static/')
```

#### Collectstatic
We can update our `boxfile.yml` to collect the assets for us:

```yaml
deploy.config:
  # collect static assets during deploy
  extra_steps:
    - python manage.py collectstatic --noinput --clear
```

## Migrate Data
The last step is to prepare any databases you might need. Just as you might `python manage.py migrate` locally, you'll need to have nanobox do that with each deploy incase you're modifying data with migrations as part of the deploy.

#### Add a deploy hook

```yaml
deploy.config:
  before_live:
    web.main:
      - python manage.py migrate --fake-initial
```

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Stage your App](/python/django/stage-your-app)
* [Launch your App](/python/django/launch-your-app)
* [Back to django overview](/python/django)
