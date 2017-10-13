# Create an Elasticsearch Component

**Important:** _Elasticsearch is a [memory-intensive service](https://www.elastic.co/guide/en/elasticsearch/guide/current/hardware.html). Without enough RAM, it will not be able to start. When deploying to production, you will likely need to scale beyond the default server size (depending on your provider)._

To add Elasticsearch to your app, add a data component to your `boxfile.yml` with the `image` set to `nanobox/elasticsearch`. You should append your image with a specific version of Elasticsearch. Available versions are listed in the [Elasticsearch Config Options guide](/elasticsearch/configure/#elasticsearch-version).

```yaml
data.elasticsearch:
  image: nanobox/elasticsearch:5
```

**Note:** _For purposes of these guides, we'll use_ `data.elasticsearch` _as the component ID._ `elasticsearch` _is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids)._

## Configure Elasticsearch
The Elasticsearch image exposes configuration options in the `boxfile.yml`. These options are nested under the `config` section of your data component. For all the available configuration options, view the [Elasticsearch Config Options guide](/elasticsearch/configure).

```yaml
data.elasticsearch:
  image: nanobox/elasticsearch:5

  # optional elasticsearch configs
  config:
    cluster_name: custom_name
```

## Re-Run Your App
With your Elasticsearch component included in your `boxfile.yml`, re-run your app to create the database.

```bash
# Create a local Elasticsearch component
nanobox run
```
