# Configure Express for Production
With very little effort you can take your app from a local development app to a full production ready app. Once your app has been configured to run in production not only will it still work locally, but you can then **guarantee** that if the dev environment works it will work in production also.

Express has a [best practices](https://expressjs.com/en/advanced/best-practice-performance.html) guide when it comes to preparing your app for production. It is recommended that you review that document before using this guide.

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io//add-components/#web-amp-worker-components). Up until now we've been running our app by consoling into the dev environment and starting the express server. In production you'll want this to happen automatically. There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a [worker component](https://docs.nanobox.io//add-components/#web-amp-worker-components).

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
code.build:
  engine: nodejs

# add a web component and give it a "start" command
web.main:
  start: NODE_ENV=production npm start
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier). The `start` command is what tells nanobox how to start your app. Since we're going to be running in production we need to tell express to run in production mode by setting the `NODE_ENV` to `production` when starting our server.

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

## Logging
By default express logs to the console which is exactly what we want. Anything that logs to stdout will automatically get picked up by the nanobox logger, and be displayed in the dashboard.

## Migrate Data
Since there is no standard tool for migrating data with nodejs, it's recommended that you find one that works for your needs and follow their documentation. For a basic migration strategy you could simply import your database schema to the production database.

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Stage your App](/nodejs/express//stage-your-app)
* [Launch your App](/nodejs/express//launch-your-app)
* [Back to express overview](/nodejs/express)
