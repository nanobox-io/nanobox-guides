# RethinkDB Config Options

RethinkDB components are configured in your `boxfile.yml`. All available configuration options are outlined below.

### Important Notes About Configuration Changes
Whenever configuration changes are made to your RethinkDB boxfile.yml config, in order to apply those changes, Nanobox must provision a new RethinkDB node.

#### Changes When Working Locally
When working in dev and dry-run, this will replace the existing node, wiping all data in the database. Data will need to be re-seeded.

#### Changes to a Production Database
When config changes are made to a production database, a new node is provisioned and data is migrated (this process must be explicitly triggered and will not be done automatically on deploy). There will be slight downtime as data is synced between the old and new node(s), but the process is designed to minimize this as much as possible. More information is available in the [Data Migrations During Scaling & Repairs ](https://docs.nanobox.io/data-management/data-migrations-scaling/) doc.

## Config Options

### RethinkDB Version
You should append the RethinkDB version number to your `image` with a `:`. The following versions are available:

- 2.3

**Note:** RethinkDB versions cannot be changed after the service is created. To use a different version, you'll have to create a new RethinkDB component and manually migrate data.

```yaml
data.db:
  image: nanobox/rethinkdb:2.3
```

### Request RethinkDB boxfile.yml Configs
One of the many benefits of using RethinkDB is that it doesn't require much configuration. The project itself is finely tuned. However we know there are settings that users may want to tweak. If there's a setting you'd like to modify that is typically handled in the `.conf`, let us know by creating a [new issue on the RethinkDB image project on Github](https://github.com/nanobox-io/nanobox-docker-rethinkdb/issues/new).
