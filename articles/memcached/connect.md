# Connect to Memcached

When using Nanobox, projects are meant to be both portable and secure. In order for your project to be both, you should use environment variables in your Memcached connections.

## Use Environment Variables to Connect
In your app's connection to Memcached, use the auto-generated HOST environment variable and the default Memcached port.

```php
# Example PHP connection

'memcached' => [
  [
    'host' => $_ENV['DATA_MEMCACHED_HOST'],
    'port' => 11211
  ],
]
```

## Auto-Generated Environment Variables
When data components are provisioned with Nanobox, unique connection credentials are generated along with environment variables for each. Secure connections to Memcached require a host and port.

*The port will always be the default Memcached port,* `11211`.

#### Variable Naming Convention
Environment variable names/keys are generated using the ID of the Memcached component in your boxfile.yml - data.memcached, data.whatever, etc. Letters are capitalized and special characters are replaced with underscores. For example:

```yaml
data.cache     => DATA_CACHE
data.memcached => DATA_MEMCACHED
data.cthulu    => DATA_CTHULU
```

Using this convention, environment variables for each required credential are generated.

```yaml
# Component ID
data.memcached

# Auto-Generated Environment Variables
DATA_MEMCACHED_HOST
```

## Viewing Environment Variables
To view the environment variables in your app, you can use the `evar ls` command.

```bash
# View environment variables in dev environment
nanobox dev evar ls
```
