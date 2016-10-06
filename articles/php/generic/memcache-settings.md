# Memcache Settings

The following settings are used to configure the PHP Memcache driver.

### memcache\_chunk\_size
Sets the [`memcache.chunk_size` PHP setting](http://php.net/manual/en/memcache.ini.php#ini.memcache.chunk-size).

```yaml
code.build:
  config:
    memcache_chunk_size: 8192
```

### memcache\_hash\_strategy
Sets the [`memcache.hash_strategy` PHP setting](http://php.net/manual/en/memcache.ini.php#ini.memcache.hash-strategy).

```yaml
code.build:
  config:
    memcache_hash_strategy: 'standard'
```
