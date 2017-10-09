# Add a Database

## Configure
You can add a database to your app by simply adding a data component to your `boxfile.yml`:

<div class="meta" data-class="snippet" data-optional-components="mysql,postgres" ></div>

In the above snippet `db` is the unique identifier of this component. It can be anything you choose as long as it is unique.

Nanobox generates the following environment variables based off that name:

* `DATA_DB_HOST` : auto-generated unique host ip
* `DATA_DB_USER` : user to connect with
* `DATA_DB_PASS` : unique password

For databases that require a name, the name will always be `gonano`.

**HEADS UP**: Your database will be provisioned the next time you `nanobox run`.

## Connect

#### Include the DB Driver Extension
Add the required extension to the list of extensions in your `boxfile.yml`.

```yaml
run.config:
  engine.config:
    extensions:
      - mysqli
```

#### Modify Your app.php
Modify your `config/app.php` to connect your app:

**Port:** The port will always be the default port of the service you're using.  
**Name:** The database name will always be `gonano`.

```php
'Datasources' => [
    'default' => [
        'className' => 'Cake\Database\Connection',
        'driver' => 'Cake\Database\Driver\Mysql',
        'persistent' => false,
        'host' => env('DATA_DB_HOST', env('DB_HOST', 'localhost')),
        /**
         * CakePHP will use the default DB port based on the driver selected
         * MySQL on MAMP uses port 8889, MAMP users will want to uncomment
         * the following line and set the port accordingly
         */
        //'port' => 'non_standard_port_number',
        'username' => env('DATA_DB_USER', env('DB_USERNAME', 'my_app')),
        'password' => env('DATA_DB_PASS', env('DB_PASSWORD', 'secret')),
        'database' => env('DATA_DB_HOST', false) ? 'gonano' : env('DB_DATABASE', 'my_app'),
        'encoding' => 'utf8',
        'timezone' => 'UTC',
        'flags' => [],
        'cacheMetadata' => true,
        'log' => false,
    ],
],
```
**HEADS UP**: Any database created by nanobox will *always* be named `gonano`

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/local-dev/managing-local-data/" target="\_blank">external client</a>.

#### From CakePHP
You can also test your connection by simply trying to run your app and see if it is able to connect. Basically, on the home page, CakePHP will show the status of database connection.

Assuming you have migrations setup according to the [official guide](https://cakephp.com/user_guide/libraries/migration.html), you can run them directly.

```bash
nanobox run php index.php migrate
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/php/cakephp/frontend-javascript)
* [Local Environment Variables](/php/cakephp/local-evars)
* [Back to CakePHP overview](/php/cakephp)
