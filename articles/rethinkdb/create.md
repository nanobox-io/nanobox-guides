# Create a RethinkDB Database

To add a RethinkDB to your app, add a data component to your boxfile.yml with the `image` set to `nanobox/rethinkdb`. You should also append your image with a specific version of RethinkDB. Available versions are listed in the [RethinkDB Config Options guide](/rethinkdb/configure/#rethinkdb-version).

```yaml
data.rethinkdb:
  image: nanobox/rethinkdb:2.3
```

**Note:** *For purposes of these guides, we'll use* `data.rethinkdb` *as the component ID.* `rethinkdb` *is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids).*

## Re-Run Your App
With your RethinkDB component included in your boxfile.yml, re-run your app to create the database.

```bash
# Create a local RethinkDB database
nanobox run
```

## Install the Client Drivers, Connect, & Setup
With your RethinkDB database running, install a client driver, connect to RethinkDB and setup the database, users, etc. How you do this depends on the language you're using:

[Install RethinkDB Drivers](https://rethinkdb.com/docs/install-drivers/)

**Note:** These instructions should be followed from within the Nanobox console after you run `nanobox run`. 
