# Add a Database

The majority of Laravel apps will require a database of some kind. Databases are added in your boxfile.yml, then provisioned when deployed into an enviroment.

## Add a Database to Your boxfile.yml

```yaml
data.db:
  image: nanobox/mysql:5.6
```

[Data Components](/components)

## Include the DB Driver Extension

```yaml
code.build:
  image: php
  config:
    extensions:
      - pdo
      - pdo_mysql
```

## Update Your Database Connection
