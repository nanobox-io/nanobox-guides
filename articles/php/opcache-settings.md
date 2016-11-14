# Opcache Settings

The following settings are used to configure the OPcache PHP byte-code caching engine.

### opcache\_memory\_consumption
Sets the [`opcache.memory_consumption` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.memory-consumption).

```yaml
run.config:
  config:
    opcache_memory_consumption: 64
```

### opcache\_validate\_timestamps
Sets the [`opcache.validate_timestamps` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.validate-timestamps).

```yaml
run.config:
  config:
    opcache_validate_timestamps: 1
```

### opcache\_revalidate\_freq
Sets the [`opcache.revalidate_freq` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.revalidate-freq)

```yaml
run.config:
  config:
    opcache_revalidate_freq: 2
```

### opcache\_revalidate\_path
Sets the [`opcache.revalidate_path` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.revalidate-path).

```yaml
run.config:
  config:
    opcache_revalidate_path: 0
```

### opcache\_save\_comments
Sets the [`opcache.save_comments` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.save-comments).

```yaml
run.config:
  config:
    opcache_save_comments: 1
```

### opcache\_load\_comments
Sets the [`opcache_load_comments` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.load-comments).

```yaml
run.config:
  config:
    opcache_load_comments: 1
```

### opcache\_enable\_file\_override
Sets the [`opcache.enable_file_override` PHP
setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.enable-file-override).
```yaml
run.config:
  config:
    opcache_enable_file_override: 0
```

### opcache\_optimization\_level
Sets the [`opcache.optimization_level` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.optimization-level).

```yaml
run.config:
  config:
    opcache_optimization_level: '0xffffffff'
```

### opcache\_inherited\_hack
Sets the [`opcache.inherited_hack` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.inherited-hack).

```yaml
run.config:
  config:
    opcache_inherited_hack: 1
```

### opcache\_dups\_fix
Sets the [`opcache.dups_fix` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.dups-fix).

```yaml
run.config:
  config:
    opcache_dups_fix: 0
```

### opcache\_blacklist\_filename
Sets the [`opcache.blacklist_filename` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.blacklist-filename).

```yaml
run.config:
  config:
    opcache_blacklist_filename: ''
```
