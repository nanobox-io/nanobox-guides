# XCache Settings

The following settings are used to configure the XCache PHP byte-code caching engine.

### xcache_size
Sets the [`xcache.size` setting](http://xcache.lighttpd.net/wiki/XcacheIni#XCacheCacher).

```yaml
run.config:
  config:
    xcache_size: 0
```

### xcache\_var\_size
Sets the [`xcache.var_size` setting](http://xcache.lighttpd.net/wiki/XcacheIni#XCacheCacher).

```yaml
run.config:
  config:
    xcache_var_size: 0
```

### xcache\_admin\_user
Sets the [`xcache.admin.user` setting](http://xcache.lighttpd.net/wiki/XcacheIni#XCacheAdministration).

```yaml
run.config:
  config:
    xcache_admin_user: 'mOo'
```

### xcache\_admin\_pass
Sets the [`xcache_admin_pass` setting](http://xcache.lighttpd.net/wiki/XcacheIni#XCacheAdministration).

```yaml
run.config:
  config:
    xcache_admin_pass: ''
```
