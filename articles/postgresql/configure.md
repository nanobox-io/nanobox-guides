# PostgreSQL Config Options

PostgreSQL components are configured in your `boxfile.yml`. All available configuration options are outlined below.

### Important Notes About Configuration Changes
Whenever configuration changes are made to your Postgres boxfile.yml config, in order to apply those changes, Nanobox must provision a new Postgres node.

#### Changes When Working Locally
When working in dev and dry-run, this will replace the existing node, wiping all data in the database. Data will need to be re-seeded.

#### Changes to a Production Database
When config changes are made to a production database, a new node is provisioned and data is migrated (this process must be explicitly triggered and will not be done automatically on deploy). There will be slight downtime as data is synced between the old and new node(s), but the process is designed to minimize this as much as possible. More information is available in the [Data Migrations During Scaling & Repairs ](https://docs.nanobox.io/data-management/data-migrations-scaling/) doc.

## Config Options

### Postgres Version
You should append the Postgres version number to your `image` with a `:`. The following versions are available:

- 9.3
- 9.4
- 9.5

**Note:** PostgreSQL versions cannot be changed after the service is created. To use a different version, you'll have to create a new PostgreSQL component and manually migrate data.

```yaml
data.db:
  image: nanobox/postgresql:9.5
```

### Custom Users/Permissions/Databases
You can create custom users with custom permissions as well as additional databases.

```yaml
data.postgresql:
  image: nanobox/postgresql:9.5
  config:
    users:
    - username: customuser
      meta:
        privileges:
        - privilege: ALL PRIVILEGES
          type: DATABASE
          'on': gonano
          grant: true
        - privilege: ALL PRIVILEGES
          type: DATABASE
          'on': customdb
          grant: true
        roles:
        - SUPERUSER
```

For each custom user specified, Nanobox will generate an environment variable for the user's password using the following pattern:

```yaml
# Pattern
COMPONENT_ID_USERNAME_PASS

# Examples

## Custom user config 1
data.postgres:
  config:
    users:
      - username: customuser

## Generated password evar 1
DATA_POSTGRES_CUSTOMUSER_PASS

## Custom user config 2
data.db:
  config:
    users:
      - username: dbuser

## Generated password evar 2
DATA_DB_DBUSER_PASS
```

### Request PostgreSQL boxfile.yml Configs
One of the many benefits of using PostgreSQL is that it doesn't require much configuration. The project itself is finely tuned. However we know there are settings that users may want to tweak. If there's a setting you'd like to modify that is typically handled in the `postgresql.conf`, let us know by creating a [new issue on the PostgreSQL image project on Github](https://github.com/nanobox-io/nanobox-docker-postgresql/issues/new).
