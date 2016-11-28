# Connect to MySQL

When using Nanobox, projects are meant to be both portable and secure. In order for your project to be both, you should use environment variables in your MySQL connections.

## Use Environment Variables to Connect
In your app's connection to MySQL, use the auto-generated environment variables.

```php
# php connection example

'mysql' => [
  'driver' => 'mysql',
  'host' => $_ENV['DATA_MYSQL_HOST'],
  'port' => '3306',
  'database' => 'gonano',
  'username' => $_ENV['DATA_MYSQL_USER'],
  'password' => $_ENV['DATA_MYSQL_PASS'],
],
```

## Auto-Generated Environment Variables
When data components are provisioned with Nanobox, unique connection credentials are generated along with environment variables for each. Secure connections to MySQL require a host, port, database name, user, and password.

**Port**  
The port will always be the default MySQL port `3306`.

**Name**  
The database name is provided by Nanobox and will always be `gonano`.

#### Variable Naming Convention
Environment variable names/keys are generated using the ID of the MySQL component in your boxfile.yml - data.mysql, data.whatever, etc. Letters are capitalized and special characters are replaced with underscores. For example:

```yaml
data.mysql  => DATA_MYSQL
data.db     => DATA_DB
data.cthulu => DATA_CTHULU
```

Using this convention, environment variables for each required credential are generated.

```yaml
# Component ID
data.mysql

# Auto-Generated Environment Variables
DATA_MYSQL_HOST
DATA_MYSQL_USER
DATA_MYSQL_PASS
```

## Viewing Environment Variables
To view the environment variables in your app, you can use the `evar ls` command.

```bash
# View environment variables in local environment
nanobox evar ls local
```
