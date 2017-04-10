# PHP Extensions Configuration

## APC

The following settings are used to configure APC, a PHP byte-code caching engine available in PHP versions 5.3 and 5.4.

#### apc\_shm\_size
Sets the [`apc.shm_size` PHP setting](http://php.net/manual/en/apc.configuration.php#ini.apc.shm-size).

```yaml
run.config:
  engine.config:
    apc_shm_size: '32M'
```

#### apc\_num\_files\_hint
Sets the [`apc.num_files_hint` PHP setting](http://php.net/manual/en/apc.configuration.php#ini.apc.num-files-hint).

```yaml
run.config:
  engine.config:
    apc_num_files_hint: 1000
```

#### apc\_user\_entries\_hint
Sets the [`apc.user_entries_hint` PHP setting](http://php.net/manual/en/apc.configuration.php#ini.apc.user-entries-hint).

```yaml
run.config:
  engine.config:
    apc_user_entries_hint: 4096
```

#### apc_filters
Sets the [`apc.filters` PHP setting](http://php.net/manual/en/apc.configuration.php#ini.apc.filters).

```yaml
run.config:
  engine.config:
    apc_filters: ''
```

## eAccelerator

The following settings are used to configure eAccelerator, a PHP byte-code caching engine available in PHP versions 5.3 and 5.4.

#### eaccelerator\_shm\_max
Sets the [`eaccelerator.shm_max` setting](https://github.com/eaccelerator/eaccelerator/wiki/Settings#eacceleratorshm_max).

```yaml
run.config:
  engine.config:
    eaccelerator_shm_max: '0'
```

#### eaccelerator\_shm\_size
Sets the [`eaccelerator.shm_size` setting](https://github.com/eaccelerator/eaccelerator/wiki/Settings#eacceleratorshm_size).

```yaml
run.config:
  engine.config:
    eaccelerator_shm_size: '0'
```

#### eaccelerator_filter
Sets the [`eaccelerator.filter` setting](https://github.com/eaccelerator/eaccelerator/wiki/Settings#eacceleratorfilter).

```yaml
run.config:
  engine.config:
     eaccelerator_filter: ''
```

## GeoIP

The following settings are used to configure the GeoIP PHP extension.

#### geoip\_custom\_directory
Sets the [`geoip.custom_directory` PHP setting](http://php.net/manual/en/geoip.configuration.php). When specifying the path to the directory, it should be relative to the root of your repo.

**Note:** When using the `geoip` php extension, you need to provide your own GeoIP database. Free databases are [available for download from Maxmind](http://dev.maxmind.com/geoip/legacy/geolite/#Downloads). Maxmind also provides subscription databases that tend to be more accurate.

```yaml
run.config:
  engine.config:
    geoip_custom_directory: 'app/GeoIP/'
```

## Memcache

The following settings are used to configure the PHP Memcache driver.

#### memcache\_chunk\_size
Sets the [`memcache.chunk_size` PHP setting](http://php.net/manual/en/memcache.ini.php#ini.memcache.chunk-size).

```yaml
run.config:
  engine.config:
    memcache_chunk_size: 8192
```

#### memcache\_hash\_strategy
Sets the [`memcache.hash_strategy` PHP setting](http://php.net/manual/en/memcache.ini.php#ini.memcache.hash-strategy).

```yaml
run.config:
  engine.config:
    memcache_hash_strategy: 'standard'
```

## Mongo

The following settings are used to configure the PHP Mongo driver.

#### mongo\_native\_long
Sets the [`mongo.native_long` PHP setting](http://php.net/manual/en/mongo.configuration.php#ini.mongo.native-long).

```yaml
run.config:
  engine.config:
    mongo_native_long: 1
```

#### mongo\_allow\_empty\_keys
Sets the [`mongo.allow_empty_keys` PHP setting](http://php.net/manual/en/mongo.configuration.php#ini.mongo.allow-empty-keys)

```yaml
run.config:
  engine.config:
    mongo_allow_empty_keys: 0
```

#### mongo_cmd
Sets the [`mongo.cmd` PHP setting](http://php.net/manual/en/mongo.configuration.php#ini.mongo.cmd).

```yaml
run.config:
  engine.config:
    mongo_cmd: '$'
```

#### mongo\_long\_as\_object
Sets the [`mongo.long_as_object` PHP setting](http://php.net/manual/en/mongo.configuration.php#ini.mongo.long-as-object).

```yaml
run.config:
  engine.config:
    mongo_long_as_object: 0
```

## New Relic

The following settings are used to configure the [PHP New Relic Agent](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration).

#### newrelic\_capture\_params
Sets the [`newrelic.capture_params` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-capture_params).

```yaml
run.config:
  engine.config:
    newrelic_capture_params: false
```

#### newrelic\_ignored\_params
Sets the [`newrelic.ignored_params` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-ignored_params).

```yaml
run.config:
  engine.config:
    newrelic_ignored_params: ''
```

#### newrelic_loglevel
Sets the [`newrelic.loglevel` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-loglevel).

```yaml
run.config:
  engine.config:
    newrelic_loglevel: 'info'
```

#### newrelic_framework
Sets the [`newrelic.framework` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-framework).

```yaml
run.config:
  engine.config:
    newrelic_framework: 'laravel'
```

#### newrelic\_framework\_drupal\_modules
Sets the [`newrelic.framework.drupal.modules` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-framework-drupal-modules).

```yaml
run.config:
  engine.config:
    newrelic_framework_drupal_modules: true
```

#### newrelic\_browser\_monitoring\_auto\_instrument
Sets the [`newrelic.browser_monitoring_auto_instrument` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-autorum).

```yaml
run.config:
  engine.config:
    newrelic_browser_monitoring_auto_instrument: true
```

#### newrelic\_transaction\_tracer\_enabled
Sets the [`newrelic.transaction_tracer.enabled` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-enable).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_enabled: true
```

#### newrelic\_transaction\_tracer\_detail
Sets the [`newrelic.transaction_tracer.detail` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-detail).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_detail: 1
```

#### newrelic\_transaction\_tracer\_record\_sql
Sets the [`newrelic.transaction_tracer.record_sql` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-sql).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_record_sql: 'obfuscated'
```

#### newrelic\_transaction\_tracer\_threshold
Sets the [`newrelic.transaction_tracer.threshold` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-threshold).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_threshold: 'apdex_f'
```

#### newrelic\_transaction\_tracer\_explain\_threshold
Sets the [`newrelic.transaction_tracer.explain_threshold` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-epthreshold).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_explain_threshold: '500'
```

#### newrelic\_transaction\_tracer\_stack\_trace\_threshold
Sets the [`newrelic.transaction_tracer.stack_trace_threshold` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-stthreshold).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_stack_trace_threshold: '500'
```

#### newrelic\_transaction\_tracer\_slow\_sql
Sets the [`newrelic.transaction_tracer.slow_sql` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-slowsql).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_slow_sql: true
```

#### newrelic\_transaction\_tracer\_custom
Sets the [`newrelic.transaction_tracer.custom` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-custom).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_custom: ''
```

#### newrelic\_error\_collector\_enabled
Sets the [`newrelic.error_collector.enabled` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-err-enabled).

```yaml
run.config:
  engine.config:
    newrelic_error_collector_enabled: true
```

#### newrelic\_error\_collector\_record\_database\_errors
Sets the [`newrelic.error_collector.record_database_errors` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-err-db).

```yaml
run.config:
  engine.config:
    newrelic_error_collector_record_database_errors: true
```

#### newrelic\_webtransaction\_name\_files
Sets the [`newrelic.webtransaction.name.files` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-wt-files).

```yaml
run.config:
  engine.config:
    newrelic_webtransaction_name_files: ''
```

#### newrelic\_webtransaction\_name\_functions
Sets the [`newrelic.webtransaction.name.functions` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-wt-funcs).

```yaml
run.config:
  engine.config:
    newrelic_webtransaction_name_functions: ''
```

#### newrelic\_webtransaction\_name\_remove\_trailing\_path
Sets the [`newrelic.webtransaction.name_remove_trailing_path` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-wt-remove-path).

```yaml
run.config:
  engine.config:
    newrelic_webtransaction_name_remove_trailing_path: false
```

## Opcache

The following settings are used to configure the OPcache PHP byte-code caching engine.

#### opcache\_memory\_consumption
Sets the [`opcache.memory_consumption` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.memory-consumption).

```yaml
run.config:
  engine.config:
    opcache_memory_consumption: 64
```

#### opcache\_validate\_timestamps
Sets the [`opcache.validate_timestamps` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.validate-timestamps).

```yaml
run.config:
  engine.config:
    opcache_validate_timestamps: 1
```

#### opcache\_revalidate\_freq
Sets the [`opcache.revalidate_freq` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.revalidate-freq)

```yaml
run.config:
  engine.config:
    opcache_revalidate_freq: 2
```

#### opcache\_revalidate\_path
Sets the [`opcache.revalidate_path` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.revalidate-path).

```yaml
run.config:
  engine.config:
    opcache_revalidate_path: 0
```

#### opcache\_save\_comments
Sets the [`opcache.save_comments` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.save-comments).

```yaml
run.config:
  engine.config:
    opcache_save_comments: 1
```

#### opcache\_load\_comments
Sets the [`opcache_load_comments` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.load-comments).

```yaml
run.config:
  engine.config:
    opcache_load_comments: 1
```

#### opcache\_enable\_file\_override
Sets the [`opcache.enable_file_override` PHP
setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.enable-file-override).
```yaml
run.config:
  engine.config:
    opcache_enable_file_override: 0
```

#### opcache\_optimization\_level
Sets the [`opcache.optimization_level` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.optimization-level).

```yaml
run.config:
  engine.config:
    opcache_optimization_level: '0xffffffff'
```

#### opcache\_inherited\_hack
Sets the [`opcache.inherited_hack` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.inherited-hack).

```yaml
run.config:
  engine.config:
    opcache_inherited_hack: 1
```

#### opcache\_dups\_fix
Sets the [`opcache.dups_fix` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.dups-fix).

```yaml
run.config:
  engine.config:
    opcache_dups_fix: 0
```

#### opcache\_blacklist\_filename
Sets the [`opcache.blacklist_filename` PHP setting](http://php.net/manual/en/opcache.configuration.php#ini.opcache.blacklist-filename).

```yaml
run.config:
  engine.config:
    opcache_blacklist_filename: ''
```

## XCache

The following settings are used to configure the XCache PHP byte-code caching engine.

#### xcache_size
Sets the [`xcache.size` setting](http://xcache.lighttpd.net/wiki/XcacheIni#XCacheCacher).

```yaml
run.config:
  engine.config:
    xcache_size: 0
```

#### xcache\_var\_size
Sets the [`xcache.var_size` setting](http://xcache.lighttpd.net/wiki/XcacheIni#XCacheCacher).

```yaml
run.config:
  engine.config:
    xcache_var_size: 0
```

#### xcache\_admin\_user
Sets the [`xcache.admin.user` setting](http://xcache.lighttpd.net/wiki/XcacheIni#XCacheAdministration).

```yaml
run.config:
  engine.config:
    xcache_admin_user: 'mOo'
```

#### xcache\_admin\_pass
Sets the [`xcache_admin_pass` setting](http://xcache.lighttpd.net/wiki/XcacheIni#XCacheAdministration).

```yaml
run.config:
  engine.config:
    xcache_admin_pass: ''
```
