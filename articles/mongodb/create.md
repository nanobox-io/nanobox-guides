# Create a MongoDB Component

To add a MongoDB to your app, add a data component to your boxfile.yml with the `image` set to `nanobox/mongodb`. You should append your image with a specific version of MongoDB. Available versions are listed in the [MongoDB Config Options guide](/mongodb/configure/#mongodb-version).

```yaml
data.mongodb:
  image: nanobox/mongodb:3.0
```

**Note:** *For purposes of these guides, we'll use* `data.mongodb` *as the component ID.* `mongodb` *is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids).*


## Configure MongoDB
The MongoDB image exposes configuration options in the boxfile.yml. These options are nested under the `config` section of your data component. For all the available configuration options, view the [MongoDB Config Options guide](/mongodb/configure).

```yaml
data.mongodb:
  image: nanobox/mongodb:3.0

  # optional mongodb configs
  config:
    objcheck: true
    log_verbosity: 'v'
```

#### Deploy Changes
With your MongoDB component included in your boxfile.yml, deploy the changes to your dev, sim, or production environment(s). During the deploy process, your MongoDB component will be created.

```bash
nanobox dev deploy
```
