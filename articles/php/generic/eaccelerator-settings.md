# eAccelerator Settings

The following settings are used to configure eAccelerator, a PHP byte-code caching engine available in PHP versions 5.3 and 5.4.

### eaccelerator\_shm\_max
Sets the [`eaccelerator.shm_max` setting](https://github.com/eaccelerator/eaccelerator/wiki/Settings#eacceleratorshm_max).

```yaml
code.build:
  config:
    eaccelerator_shm_max: '0'
```

### eaccelerator\_shm\_size
Sets the [`eaccelerator.shm_size` setting](https://github.com/eaccelerator/eaccelerator/wiki/Settings#eacceleratorshm_size).

```yaml
code.build:
  config:
    eaccelerator_shm_size: '0'
```

### eaccelerator_filter
Sets the [`eaccelerator.filter` setting](https://github.com/eaccelerator/eaccelerator/wiki/Settings#eacceleratorfilter).

```yaml
code.build:
  config:
     eaccelerator_filter: ''
```
