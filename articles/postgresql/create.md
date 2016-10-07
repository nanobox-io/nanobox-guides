# Create a PostgreSQL Database

To add a PostgreSQL to your app, add a data component to your boxfile.yml with the `image` set to `nanobox/postgresql`.

```yaml
data.postgres:
  image: nanobox/postgresql
```

**Note:** *For purposes of these guides, we'll use* `data.postgres` *as the component ID.* `postgres` *is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids).*


## Configure PostgreSQL
The PostgreSQL image exposes configuration options in the boxfile.yml. These options are nested under the `config` section of your data component. For all the available configuration options, view the [PostgreSQL Config Options guide](configure.html).

```yaml
data.postgres:
  image: nanobox/postgresql

  # optional postgres configs
  config:
    version: 9.4
```

## Build & Deploy
With your PostgreSQL component included in your boxfile.yml, build a new runtime to apply the changes, then deploy your newly built runtime into your dev, sim, or production environment(s). In the deploy process, your PostgreSQL database will be created.

```bash
# build a new runtime
nanobox build

# deploy to your dev platform
nanobox dev deploy
```
