# Managing Production Data

## Use the RethinkDB Admin UI
_**Coming Soon** - We're working on functionality that will allow you to access the built-in Admin UI for a production RethinkDB database through a secure tunnel. More information [here](https://github.com/nanobox-io/nanobox/issues/496)._

## Use the rethinkdb Utility on the Server
You can `console` into your live RethinkDB container/server and use the `rethinkdb` utility to manage your database.

```bash
# Console into your live rethinkdb container/server
nanobox console data.rethinkdb

# Use the rethinkdb utility to manage the database
rethinkdb ...
```

View the [`console` documentation](https://docs.nanobox.io/cli/console/) for more information.

## Use a Third-Party Client Over a Secure Tunnel
RethinkDB has a list of [third-party clients](https://www.rethinkdb.com/docs/third-party-admin-tools/) you can use to manage your data. For security reasons, the only way to access a database deployed with Nanobox is through a secure tunnel. The tunnel establishes a secure connection between your local machine and your remote database. It binds to a local port and forwards requests to your live database.

Use the ID of the RethinkDB component in your `boxfile.yml` to establish a tunnel (data.db, data.rethinkdb, etc.).

```bash
nanobox tunnel data.rethinkdb
```

You can then connect to your live database on `127.0.0.1:28015` using your RethinkDB client of choice. View the [`tunnel` documentation](https://docs.nanobox.io/cli/tunnel/) for more information.
