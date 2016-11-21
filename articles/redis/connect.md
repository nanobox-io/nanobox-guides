# Connect to Redis

When using Nanobox, projects are meant to be both portable and secure. In order for your project to be both, you should use environment variables in your Redis connections.

## Use Environment Variables to Connect
In your app's connection to Redis, use the auto-generated environment variables.

```ruby
# ruby connection example

$redis = Redis.new(:host => ENV['DATA_REDIS_HOST'], :port => 6379)
```

## Auto-Generated Environment Variables
When data components are provisioned with Nanobox, unique connection credentials are generated along with environment variables for each. Secure connections to Redis require a host and port.

**Port**  
The port will always be the default Redis port `6379`.

#### Variable Naming Convention
Environment variable names/keys are generated using the ID of the Redis component in your boxfile.yml - data.redis, data.whatever, etc. Letters are capitalized and special characters are replaced with underscores. For example:

```yaml
data.redis  => DATA_REDIS
data.cache  => DATA_CACHE
data.cthulu => DATA_CTHULU
```

Using this convention, environment variables for each required credential are generated.

```yaml
# Component ID
data.redis

# Auto-Generated Environment Variables
DATA_REDIS_HOST
```

## Viewing Environment Variables
To view the environment variables in your app, you can use the `evar ls` command.

```bash
# View environment variables in local environment
nanobox evar local ls
```
