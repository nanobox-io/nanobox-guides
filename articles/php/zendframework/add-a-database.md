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
      - pdo_mysql
```

#### Configure Zend Framework

_**PLACEHOLDER:** Add information about about configuring the Zend Framework database connection to use Nanobox's auto-generated environment variables._

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/data-management/managing-local-data/" target="\_blank">external client</a>.

#### From Zend Framework
_**PLACEHOLDER:** Add information about about testing the db connection from Zend Framework. One method is to try to run a migration._

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/php/zendframework/frontend-javascript)
* [Local Environment Variables](/php/zendframework/local-evars)
* [Back to Zend Framework overview](/php/zendframework)
