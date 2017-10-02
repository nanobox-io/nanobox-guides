# Add a Database

## Configure
You can add a database to your app by simply adding a data component to your `boxfile.yml`:

<div class="meta" data-class="snippet" data-optional-components="postgres,mysql,mongo,rethinkdb" ></div>

In the above snippet `db` is the unique identifier of this component. It can be anything you choose as long as it is unique.

Nanobox generates the following environment variables based off that name:

* `DATA_DB_HOST` : auto-generated unique host ip
* `DATA_DB_USER` : user to connect with
* `DATA_DB_PASS` : unique password

For databases that require a name, the name will always be `gonano`.

**HEADS UP**: The next time you `nanobox run` your database will be provisioned.

## Connect
Before connecting to the database, you'll first need to install the `sails-postgresql` adapter:

```bash
nanobox run npm install sails-postgresql --save
```

Then modify your `config/connections.js` to connect your app:

```javascript
somePostgresqlServer: {
  adapter: 'sails-postgresql',
  host: process.env.DATA_DB_HOST,
  user: process.env.DATA_DB_USER,
  password: process.env.DATA_DB_PASS,
  database: 'gonano'
  }
```

**HEADS UP**: Any database created by nanobox will *always* be named `gonano`

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/data-management/managing-local-data/" target="\_blank">external client</a>.

#### From Sails
Your can also test the connection with sails:

```bash
nanobox run sails lift
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/nodejs/sails/frontend-javascript)
* [Local Environment Variables](/nodejs/sails/local-evars)
* [Back to Sails overview](/nodejs/sails)
