# Memcache Settings

The following settings are used to configure the PHP Memcache driver.

### memcache\_chunk\_size
Sets the [`memcache.chunk_size` PHP setting](http://php.net/manual/en/memcache.ini.php#ini.memcache.chunk-size).

```yaml
run.config:
  config:
    memcache_chunk_size: 8192
```

### memcache\_hash\_strategy
Sets the [`memcache.hash_strategy` PHP setting](http://php.net/manual/en/memcache.ini.php#ini.memcache.hash-strategy).

```yaml
run.config:
  config:
    memcache_hash_strategy: 'standard'
```
