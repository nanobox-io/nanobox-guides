# PHP Config Options Overview

There are many config options available in the boxfile.yml for the PHP engine. Below is an overview of all the available options. Each is covered in more detail in the linked guides.

#### Overview of boxfile.yml PHP Configuration Options
```yaml
code.build:
  config:
    # Web Server Settings
    webserver: 'apache'
    document_root: '/'

    # PHP Settings
    runtime: 'php-5.6'
    extensions:
      - curl
      - gd
      - mbstring
      - pdo_mysql
    zend_extensions:
      - ioncube_loader
      - opcache
    dev_extensions:
      add: ['svn']
      rm: ['xcache']
    dev_zend_extensions:
      add: ['xdebug']
      rm: ['opcache']
    short_open_tag: true
    zlib_output_compression: 'Off'
    allow_url_fopen: 'On'
    disable_functions:
      - exec
      - shell_exec
      - system
    expose_php: 'On'
    max_execution_time: 30
    max_input_time: 30
    memory_limit: '128M'
    error_reporting: E_ALL
    display_errors: 'stderr'
    register_globals: 'Off'
    register_argc_argv: 'Off'
    post_max_size: '8M'
    upload_max_filesize: '2M'
    file_uploads: true
    max_file_uploads: 20
    max_input_vars: 1000
    default_mimetype: 'text/html'
    default_locale: 'en_US'
    browscap: 'app/browscap.ini'
    session_save_handler: 'files'
    session_save_path: 'app/sessions'
    session_length: 3600
    session_autostart: false
    date_timezone: 'US/central'
    iconv_internal_encoding: 'UTF-8'

    # Apache Settings
    apache_document_root: '/'
    apache_index_list:
      - index.php
      - index.html
    apache_default_gateway: 'index.php'
    apache_php_interpreter: php_fpm
    apache_modules:
      - actions
      - alias
      - rewrite
    apache_max_spares: 10
    apache_max_clients: 128
    apache_server_limit: 128
    apache_max_requests: 10000
    apache_static_expire: 86400
    apache_log_level: warn
    apache_access_log: false

    # Nginx Settings
    nginx_document_root: '/'
    nginx_index_list:
      - index.php
      - index.html
    nginx_default_gateway: 'index.php'

    # Built-In PHP Web Server Settings
    builtin_document_root: '/'

    # PHP-FPM Settings
    php_fpm_events_mechanism: 'epoll'
    php_fpm_max_children: 20
    php_fpm_max_spare_servers: 1
    php_fpm_max_requests: 128

    # PHP GeoIP Settings
    geoip_custom_directory: 'app/GeoIP/'

    # PHP Memcache Settings
    memcache_chunk_size: 8192
    memcache_hash_strategy: 'standard'

    # PHP Mongo Settings
    mongo_native_long: 1
    mongo_allow_empty_keys: 0
    mongo_cmd: '$'
    mongo_long_as_object: 0

    # PHP APC Settings
    apc_shm_size: '32M'
    apc_num_files_hint: 1000
    apc_user_entries_hint: 4096
    apc_filters: ''

    # PHP eAccelerator Settings
    eaccelerator_shm_max: '0'
    eaccelerator_shm_size: '0'
    eaccelerator_filter: ''

    # PHP OPcache Settings
    opcache_memory_consumption: 64
    opcache_validate_timestamps: 1
    opcache_revalidate_freq: 2
    opcache_revalidate_path: 0
    opcache_save_comments: 1
    opcache_load_comments: 1
    opcache_enable_file_override: 0
    opcache_optimization_level: '0xffffffff'
    opcache_inherited_hack: 1
    opcache_dups_fix: 0
    opcache_blacklist_filename: ''

    # PHP XCache Settings
    xcache_size: 0
    xcache_var_size: 0
    xcache_admin_user: 'mOo'
    xcache_admin_pass: ''

    # PHP New Relic Settings
    newrelic_capture_params: false
    newrelic_ignored_params: ''
    newrelic_loglevel: info
    newrelic_framework: 'laravel'
    newrelic_framework_drupal_modules: true
    newrelic_browser_monitoring_auto_instrument: true
    newrelic_transaction_tracer_enabled: true
    newrelic_transaction_tracer_detail: 1
    newrelic_transaction_tracer_record_sql: 'obfuscated'
    newrelic_transaction_tracer_threshold: 'apdex_f'
    newrelic_transaction_tracer_stack_trace_threshold: '500'
    newrelic_transaction_tracer_explain_threshold: '500'
    newrelic_transaction_tracer_slow_sql: true
    newrelic_transaction_tracer_custom: ''
    newrelic_error_collector_enabled: true
    newrelic_error_collector_record_database_errors: true
    newrelic_webtransaction_name_files: ''
    newrelic_webtransaction_name_functions: ''
    newrelic_webtransaction_name_remove_trailing_path: false
```

#### Quick Links
**General PHP Settings**  
[PHP Settings](php-settings.html)  
[Start Commands](start-commands.html)   
[Extensions](extensions.html)  

**Webserver Settings**  
[General Webserver Settings](webserver/webserver-settings.html)  
[Apache Settings](webserver/apache-settings.html)  
[Nginx Settings](webserver/nginx-settings.html)  
[Built-In Settings](webserver/builtin-settings.html)  

**Advanced PHP Settings**  
[APC Settings](advanced/apc-settings.html)  
[eAccelerator Settings](advanced/eaccelerator-settings.html)  
[GeoIP Settings](advanced/geoip-settings.html)  
[Memcache Settings](advanced/memcache-settings.html)  
[Mongo Settings](advanced/mongo-settings.html)  
[New Relic Settings](advanced/new-relic-settings.html)  
[Opcache Settings](advanced/opcache-settings.html)  
[PHP-FPM Settings](advanced/php-fpm-settings.html)  
[XCache Settings](advanced/xcache-settings.html)  
