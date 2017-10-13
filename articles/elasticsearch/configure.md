# Elasticsearch Config Options

Elasticsearch components are configured in your `boxfile.yml`. All available configuration options are outlined below.


## Config Options
```yaml
data.elasticsearch:
  image: nanobox/elasticsearch:5
  config:
    cluster_name: custom_name
```

### Elasticsearch Version
You should append the Elasticsearch version number to your `image` with a `:`. The following versions are available:

- 5

**Note:** Due to version compatibility constraints, Elasticsearch versions cannot be changed after the service is created. To use a different version, you'll have to create a new Elasticsearch service and manually migrate data.

```yaml
data.elasticsearch:
  image: nanobox/elasticsearch:5
```

### Cluster Name
This allows you to give a custom name to the Elasticsearch cluster. By default it uses the name of the component.

#### cluster\_name
```yaml
data.elasticsearch:
  image: nanobox/elasticsearch:5
  config:
    cluster_name: custom_name
```

## Important Notes About Configuration Changes
Whenever configuration changes are made to your Elasticsearch component in your `boxfile.yml`, in order to apply those changes, Nanobox must provision a new Elasticsearch node.

### Changes When Working Locally
When working in dev and dry-run, this will replace the existing node, wiping all data in the database. Data will need to be re-seeded.

### Changes to a Production Database
When config changes are made to a production database, a new node is provisioned and data is migrated (this process must be explicitly triggered and will not be done automatically on deploy). There will be slight downtime as data is synced between the old and new node(s), but the process is designed to minimize this as much as possible. More information is available in the [Data Migrations During Scaling & Repairs ](https://docs.nanobox.io/data-management/data-migrations-scaling/) doc.

## Request Elasticsearch boxfile.yml Configs
If there's a setting you'd like to modify that isn't currently available, please let us know by creating a [new issue on the Elasticsearch Image Github repo](https://github.com/nanobox-io/nanobox-docker-elasticsearch/issues/new).
