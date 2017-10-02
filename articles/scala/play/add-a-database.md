# Add a Database

## Configure
You can add a database to your app by simply adding a data component to your `boxfile.yml`:

<div class="meta" data-class="snippet" data-optional-components="postgres,mysql,redis" ></div>

In the above snippet `db` is the unique identifier of this component. It can be anything you choose as long as it is unique.

Nanobox generates the following environment variables based off that name:

* `DATA_DB_HOST` : auto-generated unique host ip
* `DATA_DB_USER` : user to connect with
* `DATA_DB_PASS` : unique password

For databases that require a name, the name will always be `gonano`.

**HEADS UP**: The next time you `nanobox run` your database will be provisioned.

## Connect
Play is pretty free-form when it comes to configuring a database connection. Here is an example configuration if you were using Slick, from the same people that created Play:

```scala
db = {
  connectionPool      = disabled
  url                 = "jdbc:postgresql://"${?DATA_BASE_HOST}"/gonano"
  driver              = org.postgresql.Driver
  keepAliveConnection = true
  user                = ${?DATA_BASE_USER}
  password            = ${?DATA_BASE_PASS}
}
```

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/data-management/managing-local-data/" target="\_blank">external client</a>.

#### From Play
Your can also test the connection by running your app:

```bash
nanobox run sbt run
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/scala/play/frontend-javascript)
* [Local Environment Variables](/scala/play/local-evars)
* [Back to Play overview](/scala/play)
