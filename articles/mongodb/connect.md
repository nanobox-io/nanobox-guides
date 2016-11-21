# Connect to MongoDB

When using Nanobox, projects are meant to be both portable and secure. In order for your project to be both, you should use environment variables in your MongoDB connections.

## Use Environment Variables to Connect
In your app's connection to MongoDB, use the auto-generated environment variables.

```ruby
# ruby connection example

client_host = [ENV['DATA_MONGODB_HOST']+':27017']
client_options = {
  database: 'gonano',
  user:     ENV['DATA_MONGODB_USER'],
  password: ENV['DATA_MONGODB_PASS']
}
```

## Auto-Generated Environment Variables
When data components are provisioned with Nanobox, unique connection credentials are generated along with environment variables for each. Secure connections to MongoDB require a host, port, and database name.

**Port**  
The port will always be the default MongoDB port `27017`.

**Name**  
The database name is provided by Nanobox and will always be `gonano`.

#### Variable Naming Convention
Environment variable names/keys are generated using the ID of the MongoDB component in your boxfile.yml - data.mongo, data.whatever, etc. Letters are capitalized and special characters are replaced with underscores. For example:

```yaml
data.mongodb => DATA_MONGODB
data.db      => DATA_DB
data.cthulu  => DATA_CTHULU
```

Using this convention, environment variables for each required credential are generated.

```yaml
# Component ID
data.mongodb

# Auto-Generated Environment Variables
DATA_MONGODB_HOST
```

## Viewing Environment Variables
To view the environment variables in your app, you can use the `evar ls` command.

```bash
# View environment variables in local environment
nanobox evar local ls
```
