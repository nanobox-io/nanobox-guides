# Managing Local Data

## Use the RethinkDB Admin UI
When working in your local Nanobox environment, your RethinkDB component is given it's own virtual IP to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View local app/component
nanobox info local

# ...

data.rethinkdb
  IP      : 192.19.0.2

```

In a browser, go to the IP of your RethinkDB component and connect on port `8080`. This will load the Admin UI included in the RethinkDB server. For example: `http://192.19.0.2:8080`.

![RethinkDB Admin UI](/assets/rethinkdb/rethinkdb-ui-local.png)

## Use the rethinkdb Utility on the Server
You can `console` into your locally running RethinkDB container and use the `rethinkdb` utility to manage your database. Use the `nanobox run` command in the root of your project to start your local dev environment and RethinkDB. In a separate terminal, console into your data component.

```bash
# start your local dev environment
nanobox run

# ---

# in another terminal, console into your rethinkdb component
nanobox console local data.rethinkdb

# use the rethinkdb utility to manage data
rethinkdb ...
```

_**Note:** This same method works for both_ `local` _and_ `dry-run` _environments._

## Use a Third-Party Client
RethinkDB has a list of [third-party clients](https://www.rethinkdb.com/docs/third-party-admin-tools/) you can use to manage your data. You can connect to your local RethinkDB database with a third-party client using the IP shown for your database in the `nanobox info local` output.
