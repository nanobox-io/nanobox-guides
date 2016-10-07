# Mongo Settings

The following settings are used to configure the PHP Mongo driver.

### mongo\_native\_long
Sets the [`mongo.native_long` PHP setting](http://php.net/manual/en/mongo.configuration.php#ini.mongo.native-long).

```yaml
code.build:
  config:
    mongo_native_long: 1
```

### mongo\_allow\_empty\_keys
Sets the [`mongo.allow_empty_keys` PHP setting](http://php.net/manual/en/mongo.configuration.php#ini.mongo.allow-empty-keys)

```yaml
code.build:
  config:
    mongo_allow_empty_keys: 0
```

### mongo_cmd
Sets the [`mongo.cmd` PHP setting](http://php.net/manual/en/mongo.configuration.php#ini.mongo.cmd).

```yaml
code.build:
  config:
    mongo_cmd: '$'
```

### mongo\_long\_as\_object
Sets the [`mongo.long_as_object` PHP setting](http://php.net/manual/en/mongo.configuration.php#ini.mongo.long-as-object).

```yaml
code.build:
  config:
    mongo_long_as_object: 0
```
