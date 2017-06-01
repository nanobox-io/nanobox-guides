# Create a RethinkDB Database

_**Work in Progress**_

To add a RethinkDB to your app, add a data component to your boxfile.yml with the `image` set to `nanobox/rethinkdb`. You should also append your image with a specific version of RethinkDB. Available versions are listed in the [RethinkDB Config Options guide](/rethinkdb/configure/#rethinkdb-version).

```yaml
data.rethinkdb:
  image: nanobox/rethinkdb:2.3
```

**Note:** *For purposes of these guides, we'll use* `data.rethinkdb` *as the component ID.* `rethinkdb` *is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids).*


<!-- ## Configure RethinkDB
The RethinkDB image exposes configuration options in the boxfile.yml. These options are nested under the `config` section of your data component. For all the available configuration options, view the [RethinkDB Config Options guide](/rethinkdb/configure).

```yaml
data.rethinkdb:
  image: nanobox/rethinkdb:2.3
```

## Re-Run Your App
With your RethinkDB component included in your boxfile.yml, re-run your app to create the database.

```bash
# Create a local RethinkDB database
nanobox run
```
