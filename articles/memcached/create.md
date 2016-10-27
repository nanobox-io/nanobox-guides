# Create a Memcached Component

To add a Memcached to your app, add a data component to your boxfile.yml with the `image` set to `nanobox/memcached`. You should append your image with a specific version of Memcached. Available versions are listed in the [Memcached Config Options guide](/memcached/configure/#memcached-version).

```yaml
data.memcached:
  image: nanobox/memcached:1.4
```

**Note:** *For purposes of these guides, we'll use* `data.memcached` *as the component ID.* `memcached` *is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids).*


## Configure Memcached
The Memcached image exposes configuration options in the boxfile.yml. These options are nested under the `config` section of your data component. For all the available configuration options, view the [Memcached Config Options guide](/memcached/configure).

```yaml
data.memcached:
  image: nanobox/memcached:1.4

  # optional memcached configs
  config:
    max_connections: 1024
```

## Deploy Changes
With your Memcached component included in your boxfile.yml, deploy the changes to your dev, sim, or production environment(s). During the deploy process, your Memcached component will be created.

```bash
nanobox dev deploy
```
