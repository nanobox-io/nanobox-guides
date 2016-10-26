# WordPress boxfile.yml Explained

The boxfile.yml provided in this guide includes all config options required to get a basic WordPress install up and running. Each of the config options are explained below.

```yaml
code.build:
  engine: php
  config:
    runtime: php-7.0
    extensions:
      - gd
      - mysqli
      - curl
      - zlib

web.wp:
  start:
    fpm: start-php
    apache: start-apache
  log_watch:
    apache[access]: /data/var/log/apache/access.log
    apache[error]: /data/var/log/apache/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
  network_dirs:
    data.storage:
      - wp-content/uploads/

data.db:
  image: nanobox/mysql

data.storage:
  image: nanobox/unfs
```

## code.build
The `code.build` section of your boxfile.yml allows you to configure how your code and its runtime environment are built and prepared for deploy.

### engine
The `engine` specified in your `code.build` tells Nanobox which [engine](https://docs.nanobox.io/engines/) to use when building your app. Engines define the runtime/language to use and come with different configuration options. WordPress needs the `php` engine.

```yaml
code.build:
  engine: php
```

### runtime
The `runtime` defines the PHP version. WordPress doesn't officially support running on PHP 7+, but PHP 7.0 offers significant performance improvements over previous versions of PHP. If you're migrating an existing WordPress app to Nanobox, it may be better to stick with an earlier version of PHP. A list of available php version is available in the [PHP Settings guide](/php/php-settings/#runtime).

```yaml
code.build:
  config:
    runtime: php-7.0
```

### extensions
The Nanobox PHP engine is designed to keep environments light, installing only the extensions necessary to run your app. The extensions necessary for WordPress to function are the following:

| Extension | Purpose                                                       |
|:----------|:--------------------------------------------------------------|
| `mysqli`  | The driver used to connect to MySQL                           |
| `gd`      | Used to resize uploaded images and generate thumbnails        |
| `curl`    | Used to send requests to remote servers                       |
| `zlib`    | Handles gzip'd files, used to install/update plugins & themes |

```yaml
code.build:
  config:
    extensions:
      - gd
      - mysqli
      - curl
      - zlib
```

## Web Component
Your web component will run WordPress and make it accessible over the public network. By including a web component in your boxfile.yml, Nanobox will automatically create it using settings specified in your [`code.build > config`](#code-build) as well as settings unique to your web component.

Each component in your boxfile.yml has an ID. The ID tells Nanobox what type of component to create and provides unique identifier. In this case, we'll use `web.wp`. `web` tells Nanobox to create a web component and `wp` is the unique identifier.

### start
Each web component requires one or more start commands. These tell Nanobox what commands to run to start the web server and php interpreter. By default, the PHP engine uses Apache and PHP-FPM. The following commands start each of those services.

```yaml
web.wp:
  start:
    fpm: start-php
    apache: start-apache
```

Other web servers and php interpreters are available and require different start commands. More information is provided in the following PHP guides:

[PHP Web Server Settings](http://localhost:4567/php/web-server-settings/)  
[PHP Start Commands](http://localhost:4567/php/start/)

### log_watch
Nanobox's [`log_watch` config option](https://docs.nanobox.io/app-config/app-logs/) pipe log output that is typically written to a file into your app's log stream. This allows you to view those logs without having to inspect the actual log file. What log_watches you use depends on the Web Server and PHP interpreter you're using. More information is available in the [PHP Start Commands guide](#).

```yaml
web.wp:
  log_watch:
    apache[access]: /data/var/log/apache/access.log
    apache[error]: /data/var/log/apache/error.log
    php[error]: /data/var/log/php/php_error.log
    php[fpm]: /data/var/log/php/php_fpm.log
```

### network_dirs
Network directories allow you to store the contents of specific directories in a persistent file-store. When deploying to Nanobox, web nodes are replaced by all new, updated web nodes. Without network directories, any uploads or change to the files in your app would be wiped out. Network directories allow things like uploads to persist and be shared by multiple web nodes. These require a [storage component](#storage-component).

## MySQL Database Component
WordPress needs a MySQL database. Including a data component with the `image` set to `nanobox/mysql` will tell Nanobox to provision a MySQL database when deploying your app.

```yaml
data.db:
  image: nanobox/mysql
```

## Storage Component
WordPress allows users to upload files into the filesystem. This can cause problems in multi-node, distributed applications (discussed in depth in the [Network Storage documentation](https://docs.nanobox.io/app-config/network-storage/)) and when deploying. In order for uploaded files to be shared with all web nodes and persist between deploys, you need a data/storage component that uses the `nanobox/unfs` image.

```yaml
data.storage:
  image: nanobox/unfs
```
