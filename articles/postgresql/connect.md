# Connect to PostgreSQL

When using Nanobox, projects are meant to be both portable and secure. In order for your project to be both, you should use environment variables in your PostgreSQL connections.

## Use Environment Variables to Connect
In your app's connection to PostgreSQL, use the auto-generated environment variables.

```yaml
# ruby database.yml example

production:
  adapter: postgresql
  encoding: unicode
  database: <%= ENV['DATA_DB_NAME'] %>
  pool: 5
  username: <%= ENV['DATA_DB_USER'] %>
  password: <%= ENV['DATA_DB_PASS'] %>
```

## Auto-Generated Environment Variables
When data components are provisioned with Nanobox, unique connection credentials are generated along with environment variables for each. Secure connections to PostgreSQL require a host, port, database name, user, and password.

**Port**  
The port will always be the default PostgreSQL port `5432`.

**Name**  
The database name is provided by Nanobox and will always be `gonano`.

#### Variable Naming Convention
Environment variable names/keys are generated using the ID of the PostgreSQL component in your boxfile.yml - data.postgres, data.whatever, etc. Letters are capitalized and special characters are replaced with underscores. For example:

```yaml
data.postgres => DATA_POSTGRES
data.db       => DATA_DB
data.cthulu   => DATA_CTHULU
```

Using this convention, environment variables for each required credential are generated.

```yaml
# Component ID
data.postgres

# Auto-Generated Environment Variables
DATA_POSTGRES_HOST
DATA_POSTGRES_USER
DATA_POSTGRES_PASS
```

## Viewing Environment Variables
To view the environment variables in your app, you can use the `evar ls` command.

```bash
# View environment variables in dev environment
nanobox dev evar ls
```
