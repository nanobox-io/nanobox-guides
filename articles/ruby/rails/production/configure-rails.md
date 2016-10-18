# Configure Rails for Production
With very little effort you can take your app from a local development app to a full production ready app. Once your app has been configured to run in production not only will it still work locally, but you can then **guarantee** that if the dev environment works it will work in production also.

## Add webs and workers
For your app to run in production, at the very least you'll need a [web component](). Up until now we've been running our app by consoling into the dev environment and starting the rails server. In production you'll want this to happen automatically. There is also a good chance you'll want some sort of job queue to send emails, process jobs, etc. These would all be ideal tasks for a worker.

#### Specify web components
You can have as many web components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
code.build:
  engine: "ruby"

# add a web component and give it a "start" command
web.main:
  start: rails s
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier). The `start` command will be unique to the web server you're using within your app (unicorn, puma, etc.)

#### Specify worker components
You can have as many worker components as your app needs by simply adding them to your existing `boxfile.yml`:

```yaml
code.build:
  engine: "ruby"

# add a worker component and give it a "start" command
worker.main:
  start: sidekiq
```

In the above snippet `main` is the name of the worker component and can be anything you choose (it is only used as a unique identifier). The `start` command will be unique to the background processor you're using within your app (sidekiq, resque, etc.)

## Add Writable Directories
By default, each components container is a read only environment. Rails will need certain directories available to write to for things like log output, temporary files, etc.

You'll need to specify these writable directories **per component** by updating your existing `boxfile.yml`:

```yaml
web.dashboard:
  start: rails s
  writable_dirs:
    - tmp
    -log

  # this is how production logs are piped out to the nanobox dashboard
  log_watch:
    key: 'production.log'

worker.sequences:
  start: sidekiq
  writable_dirs:
    - tmp
    - log

  # this is how logs are piped out to the nanobox dashboard
  log_watch:
    key: 'path/to/log.file'
```

## Compile Assets
For Rails to run in production we'll need to compile all of our assets. To do that you can update your existing `boxfile.yml` with an after_compile [hook]():

```yaml
code.build:
  engine: ruby

  #
  after_compile:
    - rake assets:precompile
```

## Migrate Data
The last step is to prepare any databases you might need. Just as you might `rake db:setup` locally, you'll need to have nanobox do that with each deploy incase you're modifying data with migrations as part of the deploy.

#### Add a deploy hook
Nanobox can run hooks at different points in the development process. We'll want to tell nanobox to run a special rake task each time we deploy. In your existing boxfile.yml add the following code:

```yaml
code.deploy:
  before_deploy:
    web.dashboard:
      - rake db:setup_or_migrate`
```

#### Add a rake task
You'll need to add a custom rake task that will either setup your database on first deploy, or run migrations for subsequent deploys. You could, for example, create a `lib/tasks/db.rb` file that contained the following:

```ruby
# custom tasks in the db namespace
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
```

**NOTE:** Your rake task may need to be modified to fit the database you're using.

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Stage your App](/ruby/rails/production/stage-your-app)
* [Launch your App](/ruby/rails/production/launch-your-app)
* [Back to rails overview](/ruby/rails)
