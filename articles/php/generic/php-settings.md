# PHP Settings

The following settings are typically configured in the php.ini. When using Nanobox, these are configured in the boxfile.yml.

### runtime
Specifies which PHP runtime and version to use. The following runtimes are available:

- php-5.3
- php-5.4
- php-5.5
- php-5.6
- php-7.0


```yaml
code.build:
  config:
    runtime: 'php-5.6'
```
### extensions
Specifies what PHP extensions should be included in your app's environment. To see what PHP extensions are available, view the [full list of available PHP extensions](../php-zend-extensions/).

```yaml
code.build:
  config:
    extensions:
      - curl
      - gd
      - mbstring
      - pdo_mysql
```

### dev_extensions
Specifies what extensions should be added or removed when working in a development environment.

**Note:** *Bytecode cachers should always be disabled when working in dev. If enabled, changes to php files will not appear in your running dev app because they will be cached.*

```yaml
dev_extensions:
  add:
    - svn
  rm:
    - xcache
```

### zend_extensions
Specifies what Zend extensions should be included in your app's environment. To see what Zend extensions are available, view the [Zend Extensions section of the PHP extensions list](../php-zend-extensions/#zend-extensions).

```yaml
code.build:
  config:
    zend_extensions:
      - ioncube_loader
      - opcache
```

### dev_zend_extensions
Specifies what Zend extensions should be added or removed when working in a development environment.

**Note:** *Bytecode cachers should always be disabled when working in dev. If enabled, changes to php files will not appear in your running dev app because they will be cached.*

```yaml
dev_zend_extensions:
  add:
    - xdebug
  rm:
    - opcache
```

### short\_open\_tag
Sets the [`short_open_tag` PHP setting](http://www.php.net/manual/en/ini.core.php#ini.short-open-tag).

```yaml
code.build:
  config:
    short_open_tag: true
```
### zlib\_output\_compression
Sets the [`zlib.output_compression` PHP setting](http://php.net/manual/en/zlib.configuration.php#ini.zlib.output-compression).

```yaml
code.build:
  config:
    zlib_output_compression: 'Off'
```
### allow\_url\_fopen
Sets the [`allow_url_fopen` PHP setting](http://php.net/manual/en/filesystem.configuration.php#ini.allow-url-fopen).

```yaml
code.build:
  config:
    allow_url_fopen: 'On'
```
### disable_functions
Sets the [`disable_fuctions` PHP setting](http://php.net/manual/en/ini.core.php#ini.disable-functions).

```yaml
code.build:
  config:
    disable_functions:
      - exec
      - shell_exec
      - system
```
### expose_php
Sets the [`expose_php` PHP setting](http://www.php.net/manual/en/ini.core.php#ini.expose-php).

```yaml
code.build:
  config:
    expose_php: 'On'
```
### max\_execution\_time
Sets the [`max_execution_time` PHP setting](http://www.php.net/manual/en/info.configuration.php#ini.max-execution-time).

```yaml
code.build:
  config:
    max_execution_time: 30
```
### max\_input\_time
Sets the [`max_input_time` PHP setting](http://www.php.net/manual/en/info.configuration.php#ini.max-input-time).

```yaml
code.build:
  config:
    max_input_time: 60
```
### memory_limit
Sets the [`memory_limit` PHP setting](http://php.net/manual/en/ini.core.php#ini.memory-limit). **Note:** This setting should not exceed the memory available on your PHP server(s).

```yaml
code.build:
  config:
    memory_limit: '128M'
```
### error_reporting
Sets the [`error_reporting` PHP setting](http://www.php.net/manual/en/errorfunc.configuration.php#ini.error-reporting).

```yaml
code.build:
  config:
    error_reporting: E_ALL
```
### display_errors
Sets the [`display_errors` PHP setting](http://us3.php.net/manual/en/errorfunc.configuration.php#ini.display-errors).

```yaml
code.build:
  config:
    display_errors: 'stderr'
```
### register_globals
Sets the [`register_globals` PHP setting](http://www.php.net/manual/en/ini.core.php#ini.register-globals)

```yaml
code.build:
  config:
    register_globals: 'Off'
```
### register\_argc\_argv
Sets the [`register_argc_argv` PHP setting](http://www.php.net/manual/en/ini.core.php#ini.register-argc-argv).

```yaml
code.build:
  config:
    register_argc_argv: 'Off'
```
### post\_max\_size
Sets the [`post_max_size` PHP setting](http://www.php.net/manual/en/ini.core.php#ini.post-max-size).

```yaml
code.build:
  config:
    post_max_size: '8M'
```
### upload\_max\_filesize
Sets the [`upload_max_filesize` PHP setting](http://php.net/manual/en/ini.core.php#ini.upload-max-filesize).

```yaml
code.build:
  config:
    upload_max_filesize: '2M'
```
### file_uploads
Sets the [`file_uploads` PHP setting](http://php.net/manual/en/ini.core.php#ini.file-uploads).

```yaml
code.build:
  config:
    file_uploads: true
```
### max\_file\_uploads
Sets the [`max_file_uploads` PHP setting](http://php.net/manual/en/ini.core.php#ini.max-file-uploads).

```yaml
code.build:
  config:
    max_file_uploads: 20
```
### max\_input\_vars
Sets the [`max_input_vars` PHP setting](http://php.net/manual/en/info.configuration.php#ini.max-input-vars).

```yaml
code.build:
  config:
    max_input_vars: 1000
```
### default_mimetype
Sets the [`default_mime_type` PHP setting](http://www.php.net/manual/en/ini.core.php#ini.default-mimetype).

```yaml
code.build:
  config:
    default_mimetype: 'text/html'
```
### default_locale
Sets the [`intl.default_locale` PHP setting](http://php.net/manual/en/intl.configuration.php#ini.intl.default-locale).

```yaml
code.build:
  config:
    default_locale: 'en_US'
```
### browscap
This allows you to specify the filepath to your browser capabilities file (browscap.ini). See [PHP.net Docs](http://php.net/manual/en/misc.configuration.php#ini.browscap) for definition & configuration options. When specifying the path to your browscap.ini in your boxfile.yml, it should relative to the root of your repo.

***Note:*** You must include your own browscap.ini in your app's repo. They are available for free from [browscap.org](http://browscap.org/).


```yaml
code.build:
  config:
    browscap: 'app/browscap.ini'
```
### session\_save\_handler
Sets the [`session.save_handler` PHP setting](http://www.php.net/manual/en/session.configuration.php#ini.session.save-handler).

```yaml
code.build:
  config:
    session_save_handler: 'files'
```
### session\_save\_path
Sets the [`session.save_path` PHP setting](http://www.php.net/manual/en/session.configuration.php#ini.session.save-path).

```yaml
code.build:
  config:
    session_save_path: '/tmp/nanobox/sessions'
```
### session_length
Sets the [`session.gc_maxlifetime` PHP setting](http://www.php.net/manual/en/session.configuration.php#ini.session.gc-maxlifetime).

```yaml
code.build:
  config:
    session_length: 3600
```
### session_autostart
Sets the [`session.autostart` PHP setting](http://www.php.net/manual/en/session.configuration.php#ini.session.auto-start).

```yaml
code.build:
  config:
    session_autostart: 'false'
```
### date_timezone
Sets the [`date.timezone` PHP setting](http://php.net/manual/en/datetime.configuration.php#ini.date.timezone).

```yaml
code.build:
  config:
    date_timezone: 'US/central'
```
### iconv\_internal\_encoding
Sets the [`iconv.internal_encoding` PHP setting](http://www.php.net/manual/en/iconv.configuration.php#ini.iconv.internal-encoding).

```yaml
code.build:
  config:
    iconv_internal_encoding: 'UTF-8'
```
