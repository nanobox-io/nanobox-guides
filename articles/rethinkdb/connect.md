# Connect to RethinkDB

_**Work in Progress**_

When using Nanobox, projects are meant to be both portable and secure. In order for your project to be both, you should use environment variables in your RethinkDB connections.

## Use Environment Variables to Connect
In your app's connection to RethinkDB, use the auto-generated environment variables.

```yaml
# ruby database.yml example

production:
  adapter: rethinkdb
  encoding: unicode
  database: <%= ENV['DATA_DB_NAME'] %>
  pool: 5
  username: <%= ENV['DATA_DB_USER'] %>
  password: <%= ENV['DATA_DB_PASS'] %>
```

## Auto-Generated Environment Variables
When data components are provisioned with Nanobox, unique connection credentials are generated along with environment variables for each. Secure connections to RethinkDB require a host, port, database name, user, and password.

**Port**  
The port will always be the default RethinkDB port `28015`.

**Name**  
The database name is provided by Nanobox and will always be `gonano`.

#### Variable Naming Convention
Environment variable names/keys are generated using the ID of the RethinkDB component in your boxfile.yml - data.rethink, data.whatever, etc. Letters are capitalized and special characters are replaced with underscores. For example:

```yaml
data.rethink  => DATA_RETHINK
data.db       => DATA_DB
data.cthulu   => DATA_CTHULU
```

Using this convention, environment variables for each required credential are generated.

```yaml
# Component ID
data.rethink

# Auto-Generated Environment Variables
DATA_RETHINK_HOST
DATA_RETHINK_USER
DATA_RETHINK_PASS
```

## Viewing Environment Variables
To view the environment variables in your app, you can use the `evar ls` command.

```bash
# View environment variables in local environment
nanobox evar ls local
```
