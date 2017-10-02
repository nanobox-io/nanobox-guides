# Add a Database

## Configure
You can add a database to your app by simply adding a data component to your `boxfile.yml`:

<div class="meta" data-class="snippet" data-optional-components="mysql,postgres"></div>

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
      - pdo_mysql
```

#### Configure Nette

By default Nette uses `app/config/config.local.neon` file for database configuration.

Instead, create an `app/config/database.php` where parameters from the nanobox environment variables will be populated.

```php
<?php

return [
    'parameters' => [
        'database' => [
            'host' => getenv('DATA_DB_HOST'),
            'user' => getenv('DATA_DB_USER'),
            'password' => getenv('DATA_DB_PASS'),
            'db' => 'gonano',
        ],
    ],
];
```

Don't forget to import created database config in `app/config/config.neon`.

```yml
includes:
    - database.php
```

Now open your `app/config/config.local.neon` file and modify your database settings to use populated parameters.

```yaml
database:
    dsn: "mysql:host=%database.host%;dbname=%database.db%"
    user: %database.user%
    password: %database.password%
```

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/data-management/managing-local-data/" target="\_blank">external client</a>.

#### From Nette

You can also test your connection by simply trying to load application from your browser.

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/php/nette/frontend-javascript)
* [Local Environment Variables](/php/nette/local-evars)
* [Back to Nette overview](/php/nette)
