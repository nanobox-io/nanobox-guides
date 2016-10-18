# Add a Database
Nanobox makes it effortless to launch a database for your app to connect to.

## Add a data component
Nanobox apps are comprised of [components](https://docs.nanobox.io/getting-started/add-components/) (docker images configured for nanobox).

#### Specify a database
To add a database to your app, simply add a data component to your existing `boxfile.yml`:

```yaml
code.build:
  engine: "ruby"

# for this example we're going to add a postgres database
data.db:
  image: nanobox/postgresql
```

In the above snippet `db` is the name of this component and can be anything you choose; it is used as a unique identifier and when generating [environment variables]() while `image` can be any docker image configured for nanobox.

#### Provision the database
To provision your database, you'll need to build a new runtime and deploy it to the dev environment:

```bash
# build your new runtime
nanobox build

# deploy the runtime to the dev environment
nanobox dev deploy
```

## Connect your app
When a data component is provisioned with nanobox, environment variables are generated along with unique connection credentials.

#### Environment Variables
Environment variables are generated from a combination of the component type (`data`), and the unique id (`db`), which together make the component ID (`data.db`) as specified in the boxfile:

```bash
DATA_DB_HOST = <your-components-ip>
DATA_DB_USER = nanobox
DATA_DB_PASS = <unique-password>
```

#### Connection Credentials

For rails, you'll need to modify your `config/database.yml` to connect your app:

```yaml
development:
  adapter: postgresql # this may change depending on your database
  encoding: unicode
  database: development
  pool: 5
  host: <%= ENV['DATA_DB_HOST'] %>
  username: <%= ENV['DATA_DB_USER'] %>
  password: <%= ENV['DATA_DB_PASS'] %>
```

## Test the connection
With your data component provisioned, and your app updated to connect to it, it's time to test that connection, which can do this in one of several ways.

#### Connect an external client
You can test your connection by connecting an external client to your database using your apps <a href="https://docs.nanobox.io/local-dev/managing-local-data/" target="\_blank">connection credentials</a>.

#### From within your app
You can also test your connection by simply trying to run your app and see if it is able to connect. In rails we could run the following command:

```bash
# console into the dev environment
nanobox dev console

# attempt to setup the database
bundle exec rake db:setup
```

## Now what?
With your app connected to a database, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Javascript Runtime](/ruby/rails/next-steps/javascript-runtime)
* [Local Environment Variables](/ruby/rails/next-steps/local-evars)
* [Prepare for Production](/ruby/rails/production/configure-rails)
* [Back to rails overview](/ruby/rails)
