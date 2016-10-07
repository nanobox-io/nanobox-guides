# Extensions

PHP and Zend extensions are enabled by adding them to your boxfile.yml.

```yaml
code.build:
  engine: php
  config:
    extensions:
      - curl
      - pdo
      - gd
    zend_extensions:
      - ioncube_loader
      - opcache
```

The following PHP/Zend extensions are available when using the Nanobox PHP engine, however not all extensions are available for all versions of PHP. The tables below show what PHP versions for which each extensions is available.

#### PHP Extensions
| extensions     | PHP 5.3 | PHP 5.4 | PHP 5.5 | PHP 5.6 | PHP 7.0 |
|:---------------|:-------:|:-------:|:-------:|:-------:|:-------:|
| amqp           | ✅      | ✅      | ✅      | ✅      | ✅     |
| apc            | ✅      | ✅      | ❌      | ❌      | ❌     |
| apcu           | ✅      | ✅      | ✅      | ✅      | ✅     |
| apfd           | ✅      | ✅      | ✅      | ✅      | ✅     |
| apm            | ✅      | ✅      | ✅      | ✅      | ✅     |
| bcmath         | ✅      | ✅      | ✅      | ✅      | ✅     |
| bcompiler      | ✅      | ❌      | ❌      | ❌      | ❌     |
| bz2            | ✅      | ✅      | ✅      | ✅      | ✅     |
| calendar       | ✅      | ✅      | ✅      | ✅      | ✅     |
| ctype          | ✅      | ✅      | ✅      | ✅      | ✅     |
| curl           | ✅      | ✅      | ✅      | ✅      | ✅     |
| dba            | ✅      | ✅      | ✅      | ✅      | ✅     |
| dom            | ✅      | ✅      | ✅      | ✅      | ✅     |
| eaccelerator   | ✅      | ✅      | ❌      | ❌      | ❌     |
| enchant        | ✅      | ✅      | ✅      | ✅      | ✅     |
| exif           | ✅      | ✅      | ✅      | ✅      | ✅     |
| fileinfo       | ✅      | ✅      | ✅      | ✅      | ✅     |
| filter         | ✅      | ✅      | ✅      | ✅      | ✅     |
| ftp            | ✅      | ✅      | ✅      | ✅      | ✅     |
| gd             | ✅      | ✅      | ✅      | ✅      | ✅     |
| gender         | ✅      | ✅      | ✅      | ✅      | ✅     |
| geoip          | ✅      | ✅      | ✅      | ✅      | ❌     |
| gettext        | ✅      | ✅      | ✅      | ✅      | ✅     |
| gmp            | ✅      | ✅      | ✅      | ✅      | ✅     |
| gnupg          | ✅      | ✅      | ✅      | ✅      | ❌     |
| hash           | ✅      | ✅      | ✅      | ✅      | ✅     |
| htscanner      | ✅      | ✅      | ✅      | ✅      | ❌     |
| http           | ✅      | ✅      | ✅      | ✅      | ✅     |
| iconv          | ✅      | ✅      | ✅      | ✅      | ✅     |
| igbinary       | ✅      | ✅      | ✅      | ✅      | ✅     |
| imagick        | ✅      | ✅      | ✅      | ✅      | ✅     |
| imap           | ✅      | ✅      | ✅      | ✅      | ✅     |
| intl           | ✅      | ✅      | ✅      | ✅      | ✅     |
| json           | ✅      | ✅      | ✅      | ✅      | ✅     |
| json_post      | ✅      | ✅      | ✅      | ✅      | ✅     |
| ldap           | ✅      | ✅      | ✅      | ✅      | ✅     |
| lzf            | ✅      | ✅      | ✅      | ✅      | ✅     |
| magickwand     | ✅      | ✅      | ✅      | ✅      | ❌     |
| mbstring       | ✅      | ✅      | ✅      | ✅      | ✅     |
| mcrypt         | ✅      | ✅      | ✅      | ✅      | ✅     |
| memcache       | ✅      | ✅      | ✅      | ✅      | ❌     |
| memcached      | ✅      | ✅      | ✅      | ✅      | ✅     |
| mogilefs       | ✅      | ✅      | ✅      | ✅      | ✅     |
| mongo          | ✅      | ✅      | ✅      | ✅      | ❌     |
| mongodb        | ✅      | ✅      | ✅      | ✅      | ✅     |
| mssql          | ✅      | ✅      | ✅      | ✅      | ❌     |
| mysql          | ✅      | ✅      | ✅      | ✅      | ❌     |
| mysqli         | ✅      | ✅      | ✅      | ✅      | ✅     |
| ncurses        | ✅      | ✅      | ✅      | ✅      | ❌     |
| newrelic       | ✅      | ✅      | ✅      | ✅      | ✅     |
| newt           | ✅      | ✅      | ✅      | ✅      | ❌     |
| oauth          | ✅      | ✅      | ✅      | ✅      | ✅     |
| parsekit       | ✅      | ❌      | ❌      | ❌      | ❌     |
| pcntl          | ✅      | ✅      | ✅      | ✅      | ✅     |
| pdo            | ✅      | ✅      | ✅      | ✅      | ✅     |
| pdo_dblib      | ✅      | ✅      | ✅      | ✅      | ✅     |
| pdo_mysql      | ✅      | ✅      | ✅      | ✅      | ✅     |
| pdo_odbc       | ✅      | ✅      | ✅      | ✅      | ✅     |
| pdo_pgsql      | ✅      | ✅      | ✅      | ✅      | ✅     |
| pdo_sqlite     | ✅      | ✅      | ✅      | ✅      | ✅     |
| pgsql          | ✅      | ✅      | ✅      | ✅      | ✅     |
| phalcon        | ✅      | ✅      | ✅      | ✅      | ❌     |
| phar           | ✅      | ✅      | ✅      | ✅      | ✅     |
| phpwkhtmltox   | ✅      | ✅      | ✅      | ✅      | ❌     |
| posix          | ✅      | ✅      | ✅      | ✅      | ✅     |
| propro         | ✅      | ✅      | ✅      | ✅      | ✅     |
| pspell         | ✅      | ✅      | ✅      | ✅      | ✅     |
| radius         | ✅      | ✅      | ✅      | ✅      | ❌     |
| raphf          | ✅      | ✅      | ✅      | ✅      | ✅     |
| rar            | ✅      | ✅      | ✅      | ✅      | ❌     |
| readline       | ✅      | ✅      | ✅      | ✅      | ✅     |
| recode         | ✅      | ✅      | ✅      | ✅      | ✅     |
| redis          | ✅      | ✅      | ✅      | ✅      | ✅     |
| session        | ✅      | ✅      | ✅      | ✅      | ✅     |
| shmop          | ✅      | ✅      | ✅      | ✅      | ✅     |
| simplexml      | ✅      | ✅      | ✅      | ✅      | ✅     |
| snmp           | ✅      | ✅      | ✅      | ✅      | ✅     |
| soap           | ✅      | ✅      | ✅      | ✅      | ✅     |
| sockets        | ✅      | ✅      | ✅      | ✅      | ✅     |
| sphinx         | ✅      | ✅      | ✅      | ✅      | ❌     |
| sqlite         | ✅      | ❌      | ❌      | ❌      | ❌     |
| ssh2           | ✅      | ✅      | ✅      | ✅      | ❌     |
| stats          | ✅      | ✅      | ✅      | ✅      | ✅     |
| stomp          | ✅      | ✅      | ✅      | ✅      | ✅     |
| svn            | ✅      | ✅      | ✅      | ✅      | ❌     |
| sysvmsg        | ✅      | ✅      | ✅      | ✅      | ✅     |
| sysvsem        | ✅      | ✅      | ✅      | ✅      | ✅     |
| sysvshm        | ✅      | ✅      | ✅      | ✅      | ✅     |
| tidy           | ✅      | ✅      | ✅      | ✅      | ✅     |
| timezonedb     | ✅      | ✅      | ✅      | ✅      | ✅     |
| tokenizer      | ✅      | ✅      | ✅      | ✅      | ✅     |
| txforward      | ✅      | ✅      | ✅      | ✅      | ❌     |
| uploadprogress | ✅      | ✅      | ✅      | ✅      | ❌     |
| wddx           | ✅      | ✅      | ✅      | ✅      | ✅     |
| wsf            | ✅      | ❌      | ❌      | ❌      | ❌     |
| xcache         | ✅      | ✅      | ✅      | ✅      | ❌     |
| xml            | ✅      | ✅      | ✅      | ✅      | ✅     |
| xmlreader      | ✅      | ✅      | ✅      | ✅      | ✅     |
| xmlrpc         | ✅      | ✅      | ✅      | ✅      | ✅     |
| xmlwriter      | ✅      | ✅      | ✅      | ✅      | ✅     |
| xsl            | ✅      | ✅      | ✅      | ✅      | ✅     |
| yaml           | ✅      | ✅      | ✅      | ✅      | ❌     |
| zip            | ✅      | ✅      | ✅      | ✅      | ✅     |
| zlib           | ✅      | ✅      | ✅      | ✅      | ✅     |

#### Zend Extensions
| zend_extensions | PHP 5.3 | PHP 5.4 | PHP 5.5 | PHP 5.6 | PHP 7.0 |
|:----------------|:-------:|:-------:|:-------:|:-------:|:------: |
| ioncube_loader  | ✅      | ✅      | ✅      | ✅     | ❌      |
| opcache         | ✅      | ✅      | ✅      | ✅     | ✅      |
| xdebug          | ✅      | ✅      | ✅      | ✅     | ✅      |
