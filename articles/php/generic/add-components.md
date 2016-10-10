# Add App Components

With Nanobox, every app consists of one or more "components" - supporting services that make your app work. These include things such as webservers, job-processors, databases, caches, etc.

There are three different types of components:

#### web
A code component with publicly accessible ports. Webs use the PHP runtime defined by your engine.

#### worker
A backend code component with no publicly accessible ports. Workers use the PHP runtime defined by your engine.

#### data
A component that houses data of some sort. These include databases, caches, persistent storage, etc.

## Add Components in your boxfile.yml
Components are added to your app by including them in your boxfile.yml. Each component needs an ID comprised of the component type, and a unique identifier (uid) that is completely up to you.

```yaml
# Component ID Pattern
type.uid

# Component ID Examples
web.site
worker.jobs
data.db
```

### Web & Worker Components
The minimum required information for webs and workers is a `start` command. These tell Nanobox how to start the service.

The PHP engine gives you the option to use Apache with PHP-FPM, Apache with mod-php, Nginx, or the built-in PHP webserver available with PHP 5.4+. Whatever you choose to go with, the engine provides start command helpers. These are outlined in the [Start Commands](config/start-commands) guide.

```yaml
web.site:
  start:
    fpm: start-php
    apache: start-apache

worker.jobs:
  start: 'php worker.php'
```

### Data Components
Data components house data of some sort. These include databases, caches, persistent storage, etc. Each data component needs an [image](/images) - a docker image used to provision the service.

```yaml
data.postgres:
  image: nanobox/postgresql

data.storage:
  image: nanbox/unfs
```

#### Data Service Guides
- [PostgreSQL Guides](/postgresql)
- [MySQL Guides](/mysql)
- [MongoDB Guides](/mongodb)
- [Redis Guides](/redis)
- [Memcached Guides](/memcached)
- [Storage Guides](/storage)

### Build & Deploy to Provision  Components
To provision your components, build a new runtime and deploy it.

```bash
# build an updated runtime
$ nanobox build

# deploy the runtime into dev
# and provision components
$ nanobox dev deploy
```

**Note:** Web and worker components are provisioned and started in sim and production environments, but not in dev. Data components are provisioned in all components.
