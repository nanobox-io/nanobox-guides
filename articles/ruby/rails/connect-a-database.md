# Rails: Connect a Database
With an application (app) [up and running](getting-started.html#up-and-running) in the development (dev) environment using nanobox, lets connect a database.

This guide is broken down into three sections:

1. [Add a data component](add-a-data-component)
2. [Connect your app](connect-your-app)
3. [Test the connection](test-the-connection)

## Add a data component
Nanobox apps are comprised of [components](). If your app has a database it needs to connect to, then you can add [a data component]().

#### Specify the component
To add a data component to your app, simply add a data component to your `boxfile.yml` like in the following example:

```yaml
# because we're using rails we need to tell nanobox that we need ruby in our
# container
code.build:
  engine: "ruby"

# specify that we need a data component (called "db"); for this example we'll
# use postgresql as our database
data.db:
  image: nanobox/postgresql
```

#### Provision the component
In order for nanobox to provision your data component, you'll need to rebuild your environment and deploy it to the dev runtime:

```bash
# build your new environment
nanobox build

# deploy the environment to the dev runtime
nanobox dev deploy
```

## Connect your app
When a data component is provisioned with nanobox, unique connection credentials are generated along with [environment variables](). The key for each variable is based on the [component ID]() in your boxfile.yml. Using environment variables in this way allows your app to be secure yet portable.

#### Environment Variables
With the data component added, nanobox would generate the following environment variables:

```bash
DATA_DB_HOST = <your-apps-ip>
DATA_DB_USER = nanobox
DATA_DB_PASS = <unique-password>
```

***PRO TIP:*** You can list environment variables your dev environment has available using `nanobox dev evar ls` or `nanobox dev console`:

```bash
# list all nanobox environment variables
nanobox dev evar ls

# console into the dev environment and list ALL environment variables
nanobox dev console
env
```

#### Connection Credentials

| credential | value |
|---|---|
| port | the default port for that service |
| name | gonano |

For rails, you'll need to modify your `config/database.yml` to connect your app:

```yaml
development:
  adapter: postgresql # this may change depending on your database
  encoding: unicode
  database: gonano
  pool: 5
  host: <%= ENV['DATA_DB_HOST'] %>
  username: <%= ENV['DATA_DB_USER'] %>
  password: <%= ENV['DATA_DB_PASS'] %>
```

## Test the connection
With your data component provisioned, and your app updated to connect to it, it's time to test that connection. You can do this in one of several ways.

#### Connect an external client
You can test your connection by connecting an external client to your database using the [connection credentials](#connection-credentials) above. You'll also need to run `nanobox dev info` to get the host, username, and password.

#### Running your app
You can also test your connection by simply trying to run your app and see if it is able to connect. In rails we could run the following command:

```bash
# console into the dev environment
nanobox dev console

# attempt to setup the database
bundle exec rake db:setup
```

## Now what?
With a database connected to your app, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preparing for production](preparing-for-production.html)
* [Launching your app](launching-your-app.html)
* [Back to rails overview](overview.html)
