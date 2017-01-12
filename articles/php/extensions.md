# PHP Extensions

PHP and Zend extensions are enabled by adding them to your boxfile.yml.

```yaml
run.config:
  engine.config:
    extensions:
      - curl
      - pdo
      - gd
    zend_extensions:
      - ioncube_loader
      - opcache
```

**Note:** Extensions are loaded in the order in which they're listed. Some extensions must be loaded first in order for other extensions to work.

## Dev Config

#### dev_extensions
Specifies what extensions should be added or removed when working in a development environment.

**Note:** *Bytecode cachers should always be disabled when working in dev. If enabled, changes to php files will not appear in your running dev app because they will be cached.*

```yaml
dev_extensions:
  add:
    - svn
  rm:
    - xcache
```

#### dev_zend_extensions
Specifies what Zend extensions should be added or removed when working in a development environment.

**Note:** *Bytecode cachers should always be disabled when working in dev. If enabled, changes to php files will not appear in your running dev app because they will be cached.*

```yaml
dev_zend_extensions:
  add:
    - xdebug
  rm:
    - opcache
```


The following PHP/Zend extensions are available when using the Nanobox PHP engine, however not all extensions are available for all versions of PHP. The tables below show what PHP versions for which each extensions is available.

## PHP Extension Per PHP Version
| extensions     | 5.3 | 5.4 | 5.5 | 5.6 | 7.0 | 7.1 |
|:---------------|:---:|:---:|:---:|:---:|:---:|:---:|
| amqp           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| apc            | ✅  | ✅  | ❌  | ❌  | ❌  | ❌  |
| apcu           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| apfd           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| apm            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| bcmath         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| bcompiler      | ✅  | ❌  | ❌  | ❌  | ❌  | ❌  |
| blackfire      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| bz2            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| calendar       | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| ctype          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| curl           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| dba            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| dom            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| eaccelerator   | ✅  | ✅  | ❌  | ❌  | ❌  | ❌  |
| enchant        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| exif           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| fileinfo       | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| filter         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| ftp            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| gd             | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| gender         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| geoip          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| gettext        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| gmp            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| gnupg          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| hash           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| htscanner      | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| http           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| iconv          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| igbinary       | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| imagick        | ✅  | ✅  | ✅  | ✅  | ✅  | ❌  |
| imap           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| intl           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| json           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| json_post      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| ldap           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| lzf            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| magickwand     | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| mbstring       | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| mcrypt         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| memcache       | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| memcached      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| mogilefs       | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| mongo          | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| mongodb        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| mssql          | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| mysql          | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| mysqli         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| ncurses        | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| newrelic       | ✅  | ✅  | ✅  | ✅  | ✅  | ❌  |
| newt           | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| oauth          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| parsekit       | ✅  | ❌  | ❌  | ❌  | ❌  | ❌  |
| pcntl          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| pdo            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| pdo_dblib      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| pdo_mysql      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| pdo_odbc       | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| pdo_pgsql      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| pdo_sqlite     | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| pgsql          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| phalcon        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| phar           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| phpwkhtmltox   | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| posix          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| propro         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| pspell         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| radius         | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| raphf          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| rar            | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| readline       | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| recode         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| redis          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| session        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| shmop          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| simplexml      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| snmp           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| soap           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| sockets        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| sphinx         | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| sqlite         | ✅  | ❌  | ❌  | ❌  | ❌  | ❌  |
| sqlite3        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| ssh2           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| stats          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| stomp          | ✅  | ✅  | ✅  | ✅  | ✅  | ❌  |
| svn            | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| sysvmsg        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| sysvsem        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| sysvshm        | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| tidy           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| timezonedb     | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| tokenizer      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| txforward      | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| uploadprogress | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| wddx           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| wsf            | ✅  | ❌  | ❌  | ❌  | ❌  | ❌  |
| xcache         | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| xml            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| xmlreader      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| xmlrpc         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| xmlwriter      | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| xsl            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| yaml           | ✅  | ✅  | ✅  | ✅  | ❌  | ❌  |
| zip            | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| zlib           | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |

## Zend Extension Per PHP Version
| zend_extensions | 5.3 | 5.4 | 5.5 | 5.6 | 7.0 | 7.1 |
|:----------------|:---:|:---:|:---:|:---:|:---:|:---:|
| ioncube_loader  | ✅  | ✅  | ✅  | ✅  | ✅  | ❌  |
| opcache         | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
| xdebug          | ✅  | ✅  | ✅  | ✅  | ✅  | ✅  |
