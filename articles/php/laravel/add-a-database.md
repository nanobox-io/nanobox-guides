# Add a Database
The majority of Laravel apps will require a database of some kind. Databases are added in your boxfile.yml, then provisioned when deployed into an environment.

## Add a Data Component to Your boxfile.yml
Apps built with Nanobox are comprised of [components](https://docs.nanobox.io/getting-started/add-components/) - supporting services that make your app work. To create a database, add a data component to your boxfile.yml. For this example, we'll use add a MySQL database.

```yaml
run.config:
  engine: php

data.db:
  image: nanobox/mysql:5.6
```

*You can view guides for other data components in the [Data Components guides](/components).*

### Include the DB Driver Extension
In order for your app to communicate with your database, it will need a driver. Drivers are installed as PHP extensions. Add the required extension to the list of extensions in the `run.config > config` section of your boxfile.yml.

```yaml
run.config:
  image: php
  config:
    extensions:
      - pdo_mysql
```

## Update Your Database Connection
Whenever a data component is added, Nanobox will auto-generate environment variables (evar) for required connection credentials.

#### Environment Variables
Evar keys are generated using the ID of your data component. For example, `data.db` will generate evars beginning with `DATA_DB` and appended with the credential name:

```txt
DATA_DB_HOST
DATA_DB_USER
DATA_DB_PASS
```

#### Modify Your database.php
In your `config/database.php`, update the database connection credentials to use the auto-generated evars and Nanobox-provided credentials:

**Port:** The port will always be the default port of the service you're using.  
**Name:** The database name will always be `gonano`.    

```php
'connections' => [
  'mysql' => [
    'driver'    => 'mysql',

    // Update to use Nanobox creds and evars
    'host'      => $_ENV['DATA_DB_HOST']
    'port'      => '3306',
    'database'  => 'gonano',
    'username'  => $_ENV['DATA_DB_USER'],
    'password'  => $_ENV['DATA_DB_PASS'],

    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
    'strict'    => true,
    'engine'    => null,
  ],
],
```

#### Deploy Changes
With the data component and required php extension added to your boxfile.yml and the connection updated, deploy the changes to the dev environment. Your database will be provisioned and connected to your app in the deploy process.

```bash
nanobox dev deploy
```
