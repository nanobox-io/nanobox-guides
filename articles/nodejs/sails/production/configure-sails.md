# Configure Sails for Production
With very little effort you can take your app from a local development app to a full production ready app. Once your app has been configured to run in production not only will it still work locally, but you can then **guarantee** that if the dev environment works it will work in production also.

Sails has a [best practices](http://sailsjs.org/documentation/concepts/deployment) guide when it comes to preparing your app for production. It is recommended that you review that document before using this guide.

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components). Up until now we've been running our app by consoling into the dev environment and starting the sails server. In production you'll want this to happen automatically. There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io/getting-started/add-components/#web-amp-worker-components).

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
code.build:
  engine: nodejs

# add a web component and give it a "start" command
web.main:
  start: NODE_ENV=production node app.js --prod
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier). The `start` command is what tells nanobox how to start your app. Notice that we're not using `sails lift` to start the app. [Sails recommends](http://sailsjs.org/documentation/concepts/deployment#?lift-your-app) starting the app using node to avoid dependencies on the sails command line tool.

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
By default sails only logs to the console, but for better debugging we'll want to add some log files. At the root of your project, create a `log` folder with a `sails.log` file.

Next edit your `config/log.js` file to include a `filepath` to where you want sails to save logs. Inside the `module.exports` include the following:
```javascript
filepath: 'log/sails.log'
```
#### Make logs writable
By default, each components container is a read only environment. Now that we're having sails write logs we'll need to tell nanobox those files are writable.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
code.build:
  engine: nodejs

web.main:
  start: NODE_ENV=production node app.js

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
  start: NODE_ENV=production node app.js
  writable_dirs:
    - log

  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    key: 'log/sails.log'

worker.main:
  start: <start-worker>
  writable_dirs:
    - log

  # the path to a logfile you want streamed to the nanobox dashboard
  log_watch:
    key: 'log/sails.log'
```

You can visit the [log_watch](https://docs.nanobox.io/boxfile/web/#custom-logs) doc for more information about this node.

## Migrate Data
The last step is to prepare any databases you might need. By default [sails does not allow production migrations](http://sailsjs.org/documentation/concepts/models-and-orm/model-settings#?can-i-use-automigrations-in-production). The recommended way is to import your database schema [manually](http://sailsjs.org/documentation/concepts/deployment#?set-up-production-database-s-for-your-models) into the production database.

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Stage your App](/nodejs/sails/production/stage-your-app)
* [Launch your App](/nodejs/sails/production/launch-your-app)
* [Back to sails overview](/nodejs/sails)
