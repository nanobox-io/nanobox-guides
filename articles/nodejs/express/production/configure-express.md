# Configure Express for Production
With very little effort you can take your app from a local development app to a full production ready app. Once your app has been configured to run in production not only will it still work locally, but you can then **guarantee** that if the dev environment works it will work in production also.

Express has a [best practices](https://expressjs.com/en/advanced/best-practice-performance.html) guide when it comes to preparing your app for production. It is recommended that you review that document before using this guide.

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components). Up until now we've been running our app by consoling into the dev environment and starting the express server. In production you'll want this to happen automatically. There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components).

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
code.build:
  engine: nodejs

# add a web component and give it a "start" command
web.main:
  start: npm start
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier). The `start` command is what tells nanobox how to start your app.

#### Specify worker components
You can have as many worker components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
code.build:
  engine: nodejs

# add a worker component and give it a "start" command
worker.main:
  start: <start-worker>
```

In the above snippet `main` is the name of the worker component and can be anything you choose (it is only used as a unique identifier). The `start` command will be unique to the background processor you're using within your app.

You can visit the [writable_dirs](https://docs.nanobox.io/boxfile/web/#writable-directories) doc for more information about this node.

## Add Logs
By default express only logs to the console, but for better debugging we'll want to add some log files. At the root of your project, create a `log` folder with a `express.log` file.

Next we'll need pipe the default express logs into our log file. In your `server.js` add the following:
```javascript
var fs = require('fs');
var logfile = fs.createWriteStream('log/express.log', {flags: 'a'});
app.use(express.logger({stream: logfile}));
```
#### Make logs writable
By default, each components container is a read only environment. Now that we're having express write logs we'll need to tell nanobox those files are writable.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
code.build:
  engine: nodejs

web.main:
  start: npm start

  # add writable dirs to your web component
  writable_dirs:
    - log

worker.main:
  start: <start-worker>

  # add writable dirs to your worker component
  writable_dirs:
    - log
```

#### Add Streaming Logs
Although our app is now able to write it's logs to log files, if want it to stream those logs to the nanobox dashboard we'll need to add a `log_watch` path to the boxfile:

```yaml
code.build:
  engine: nodejs

web.main:
  start: npm start
  writable_dirs:
    - log

  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    key: 'log/express.log'

worker.main:
  start: <start-worker>
  writable_dirs:
    - log

  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    key: 'log/express.log'
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Migrate Data

## Enable Production
By default express runs in development mode. Once you're ready for production you'll need to tell express to run in production mode by setting the `NODE_ENV` to `production` when starting our server.

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Stage your App](/nodejs/express/production/stage-your-app)
* [Launch your App](/nodejs/express/production/launch-your-app)
* [Back to express overview](/nodejs/express)
