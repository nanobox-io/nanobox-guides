# MongoDB Config Options

MongoDB components are configured in your `boxfile.yml`. All available configuration options are outlined below.

### Important Notes About Configuration Changes
Whenever configuration changes are made to your MongoDB boxfile.yml config, in order to apply those changes, Nanobox must provision a new MongoDB node.

#### Changes When Working Locally
When working in dev and dry-run, this will replace the existing node, wiping all data in the database. Data will need to be re-seeded.

#### Changes to a Production Database
When config changes are made to a production database, a new node is provisioned and data is migrated (this process must be explicitly triggered and will not be done automatically on deploy). There will be slight downtime as data is synced between the old and new node(s), but the process is designed to minimize this as much as possible. More information is available in the [Data Migrations During Scaling & Repairs ](https://docs.nanobox.io/data-management/data-migrations-scaling/) doc.

## Config Options
```yaml
data.db:
  image: nanobox/mongodb:3.2
  config:
    objcheck: true
    log_verbosity: 'v'
    directoryperdb: true
    logappend: true
    nojournal: false
    noscripting: false
```

### MongoDB Version
You should append the MongoDB version number to your `image` with a `:`. The following versions are available:

- 2.6
- 3.0
- 3.2
- 3.4

**Note:** Due to version compatibility constraints, MongoDB versions cannot be changed after the service is created. To use a different version, you'll have to create a new MongoDB service and manually migrate data.

```yaml
data.db:
  image: nanobox/mongodb:3.2
```

### objcheck
View the [MongoDB documentation](http://docs.mongodb.org/manual/reference/configuration-options/#diaglog) for details and configuration options.

```yaml
#default setting
data.db:
  image: nanobox/mongodb
  config:
    objcheck: true
```

### log\_verbosity
View the [MongoDB documentation](http://docs.mongodb.org/manual/reference/configuration-options/#verbose) for details and configuration options.

```yaml
data.db:
  image: nanobox/mongodb
  config:
    log_verbosity: 'v'
```

### directoryperdb
View the [MongoDB documentation](http://docs.mongodb.org/manual/reference/configuration-options/#directoryperdb) for details and configuration options.

```yaml
#default setting
data.db:
  image: nanobox/mongodb
  config:
    directoryperdb: true
```

### logappend
View the [MongoDB documentation](http://docs.mongodb.org/manual/reference/configuration-options/#logappend) for details and configuration options.

```yaml
#default setting
data.db:
  image: nanobox/mongodb
  config:
    logappend: true
```

### nojournal
View the [MongoDB documentation](http://docs.mongodb.org/manual/reference/configuration-options/#nojournal) for details and configuration options.

```yaml
#default setting
data.db:
  image: nanobox/mongodb
  config:
    nojournal: false
```

### noscripting
View the [MongoDB documentation](http://docs.mongodb.org/manual/reference/configuration-options/#noscripting) for details and configuration options.

```yaml
#default setting
data.db:
  image: nanobox/mongodb
  config:
    noscripting: false
```

### Request MongoDB boxfile.yml Configs
If there's a setting you'd like to modify that isn't currently available, please let us know by creating a [new issue on the MongoDB Image Github repo](https://github.com/nanobox-io/nanobox-docker-mongodb/issues/new).
