# Create a MySQL Database

To add a MySQL to your app, add a data component to your boxfile.yml with the `image` set to `nanobox/mysql`. You should append your image with a specific version of MySQL. Available versions are listed in the [MySQL Config Options guide](/mysql/configure/#mysql-version).

```yaml
data.mysql:
  image: nanobox/mysql:5.6
```

**Note:** *For purposes of these guides, we'll use* `data.mysql` *as the component ID.* `mysql` *is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids).*


## Configure MySQL
The MySQL image exposes configuration options in the boxfile.yml. These options are nested under the `config` section of your data component. For all the available configuration options, view the [MySQL Config Options guide](/mysql/configure).

```yaml
data.mysql:
  image: nanobox/mysql:5.6

  # optional mysql configs
  config:
    plugins:
      - federated
      - audit_log
    event_scheduler: 'Off'
```

## Deploy Changes
With your MySQL component included in your boxfile.yml, deploy the changes to your dev, sim, or production environment(s). During the deploy process, your MySQL component will be created.

```bash
nanobox dev deploy
```
