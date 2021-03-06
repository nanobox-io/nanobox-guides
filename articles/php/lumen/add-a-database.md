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

#### Modify Your app
Slim is pretty free-form when it comes to configuring a database connection. However you choose to configure your connection, you can access the following environment variables:

```php
user = $_ENV["DATA_DB_USER"]
pass = $_ENV["DATA_DB_PASS"]
host = $_ENV["DATA_DB_HOST"]
```

**HEADS UP**: Any database created by nanobox will *always* be named `gonano`

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/local-dev/managing-local-data/" target="\_blank">external client</a>.

#### From Lumen
You can also test your connection by simply trying to run your app and see if it is able to connect.

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/php/lumen/frontend-javascript)
* [Local Environment Variables](/php/lumen/local-evars)
* [Back to Lumen overview](/php/lumen)
