# Rails: Connecting a Database
Once you have an app [up and running](getting-started.html#up-and-running) the next thing may need to do is connect a database.

The guide is broken down into three sections:

1. [Adding a data component](adding-a-data-component)
2. [Connecting your application](connecting-your-application)
3. [Testing the connection](testing-the-connection)

## Adding a data component
Nanobox applications are comprised of [components](). If your application has a database it needs to connect to then you can add [a data component]().

#### Specify the component
To add a data component to your app, simply specify what you need in the `boxfile.yml`:

```yaml
code.build:

  # because we're using rails we need to tell nanobox that we need ruby in our container
  engine: "ruby"

# specify that we need a data component (called "db")
data.db:

  # for this example we'll used postgresql as our database
  image: nanobox/postgresql
```

#### Provision the component
In order for nanobox to provision your data component, you'll need to rebuild your environment and deploy it to the development runtime:

```bash
# build your new environment
nanobox build

# deploy the environment to the development runtime
nanobox dev deploy
```

## Connecting your application
When a data component is provisioned with nanobox, unique connection credentials are generated along with [environment variables](). The keys for each variable is based on the [component ID]() in your boxfile.yml. Using environment variables in this way allows your application to be secure yet portable.

#### Environment Variables
With the data component added, nanobox would generate the following environment variables:

```bash
DATA_DB_HOST = <your-apps-ip>
DATA_DB_USER = nanobox
DATA_DB_PASS = <unique-password>
```

***ADVANCED TIP:*** You can list all environment variables your dev environment has available using `nanobox dev console`:

```bash
# console into the dev environment
nanobox dev console

# list all environment variables
env
```

#### Connection Credentials
Data component ports will always be the default port for that service. Database connections that require a name, should use `gonano`.

For rails, you'll need to modify your `config/database.yml` to connect your application:

```yml
development:
  adapter: postgresql
  encoding: unicode
  database: <%= ENV['DATA_DB_NAME'] %>
  pool: 5
  host: <%= ENV['DATA_DB_HOST'] %>
  username: <%= ENV['DATA_DB_USER'] %>
  password: <%= ENV['DATA_DB_PASS'] %>
```

## Testing the connection
With your data component provisioned, and your application updated to connect to it, it's time to test that connection. You can do this in one of several ways.

#### Connecting an external client
You can test your connection by connecting an external client to your database using the [connection credentials](#connection-credentials) above.

#### Running your application
You can also test your connection by simply trying to run your application and see if it is able to connect. In rails we could run the following command:

```bash
# console into the dev environment
nanobox dev console

# attempt to setup the database
bundle exec rake db:setup
```

## Now what?
Now that you have a database connected to your application whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preparing for production](preparing-for-production.html)
* [Launching your app](launching-your-app.html)
