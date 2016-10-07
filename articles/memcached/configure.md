# Memcached Config Options

Memcached components are configured in your `boxfile.yml`. All available configuration options are outlined below.

```yaml
data.memcached:
  image: nanobox/memcached
  config:
    version: 1.4
    return_error_on_memory_exhausted: false
    max_connections: 1024
    chunk_size_growth_factor: 1.25
    minimum_allocated_space: 48
    maximum_requests_per_event: 20
    disable_cas: false
    max_backlog: 1024
    binding_protocol: 'auto'
```

### version
When configuring a Memcached component in your Boxfile, you can specify which version to use. The following version(s) are available:

- 1.4

**Note:** Due to version compatibility constraints, memcached versions cannot be changed after the component is created. To use a different version, you'll have to create a new Memcached component.

```yaml
# default setting
data.memcached:
  image: nanobox/memcached
  config:
    version: 1.4
```

#### return\_error\_on\_memory\_exhausted
This allows you to have memcached return an error when memory is exhausted rather than removing items.

```yaml
#default setting
data.memcached:
  image: nanobox/memcached
  config:
    return_error_on_memory_exhausted: false
```

#### max\_connections
Sets the limit for simultaneous connections.

```yaml
#default setting
data.memcached:
  image: nanobox/memcached
  config:
    max_connections: 1024
```

#### chunk\_size\_growth\_factor
Specifies the chunk size growth factor.

```yaml
#default setting
data.memcached:
  image: nanobox/memcached
  config:
    chunk_size_growth_factor: 1.25
```

#### minimum\_allocated\_space
Sets the minimum space allocated for key+value+flags.

```yaml
#default setting
data.memcached:
  image: nanobox/memcached
  config:
    minimum_allocated_space: 48
```

#### maximum\_requests\_per\_event
Sets the maximum number of requests per event and limits the number of requests processed for a given connection to prevent starvation.

```yaml
#default setting
data.memcached:
  image: nanobox/memcached
  config:
    maximum_requests_per_event: 20
```

#### disable\_cas
Allows you to disable the use of [CAS](https://code.google.com/p/memcached/wiki/NewCommands#cas).

```yaml
#default setting
data.memcached:
  image: nanobox/memcached
  config:
    disable_cas: false
```

#### max\_backlog
Sets the backlog queue limit.

```yaml
#default setting
data.memcached:
  image: nanobox/memcached
  config:
    max_backlog: 1024
```

#### binding\_protocol
Allows you to set the binding protocol. The following are available:

- auto
- ascii
- binary

```yaml
#default setting
data.memcached:
  image: nanobox/memcached
  config:
    binding_protocol: 'auto'
```
