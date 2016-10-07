# PostgreSQL Config Options

PostgreSQL components are configured in your `boxfile.yml`. All available configuration options are outlined below.

### version
Specifies which Postgres version to use. The following version(s) are available:

- 9.3
- 9.4 *(default)*
- 9.5

**Note:** PostgreSQL versions cannot be changed after the service is created. To use a different version, you'll have to create a new PostgreSQL component and manually migrate data.

```yaml
# default setting
data.db:
  image: nanobox/postgresql
  config:
    version: 9.4
```

### Request PostgreSQL boxfile.yml Configs
One of the many benefits of using PostgreSQL is that it doesn't require much configuration. The project itself is finely tuned. However we know there are settings that users may want to tweak. If there's a setting you'd like to modify that is typically handled in the `postresql.conf`, let us know by creating a [new issue on the PostgreSQL image project on Github](https://github.com/nanobox-io/nanobox-docker-postgresql/issues/new).
