# Connect to RethinkDB

When using Nanobox, projects are meant to be both portable and secure. In order for your project to be both, you should use environment variables in your RethinkDB connections.

## Use Environment Variables to Connect
In your app's connection to RethinkDB, use the auto-generated environment variable(s).

```javascript
// js connection config example

module.exports = {
  rethinkdb: {
    host: process.env.DATA_DB_HOST,
    port: 28015,
    authKey: '',
    db: 'rethinkdb'
  }
}
```

## Auto-Generated Environment Variables
When data components are provisioned with Nanobox, unique connection credentials are generated along with environment variables for each. Secure connections to RethinkDB require a host and port. You create the database and specify the database name when setting up RethinkDB.

**Port**  
The port will always be the default RethinkDB port `28015`.

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
```

## Viewing Environment Variables
To view the environment variables in your app, you can use the `evar ls` command.

```bash
# View environment variables in local environment
nanobox evar ls local
```
