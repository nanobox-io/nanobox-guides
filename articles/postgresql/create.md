# Create a PostgreSQL Database

To add a PostgreSQL to your app, add a data component to your boxfile.yml with the `image` set to `nanobox/postgresql`. You should also append your image with a specific version of Postgres. Available versions are listed in the [Postgres Config Options guide](/postgresql/configure/#postgres-version).

```yaml
data.postgres:
  image: nanobox/postgresql:9.5
```

**Note:** *For purposes of these guides, we'll use* `data.postgres` *as the component ID.* `postgres` *is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids).*


<!-- ## Configure PostgreSQL
The PostgreSQL image exposes configuration options in the boxfile.yml. These options are nested under the `config` section of your data component. For all the available configuration options, view the [PostgreSQL Config Options guide](/postgresql/configure).

```yaml
data.postgres:
  image: nanobox/postgresql:9.5

  # optional postgres configs
  config:
    version: 9.5
``` -->

## Re-Run Your App
With your PostgreSQL component included in your boxfile.yml, re-run your app to create the database.

```bash
# Create a local Postgres database
nanobox run
```
