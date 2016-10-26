# Debugging
As with any application, the process of debugging is incredibly important. Logs are the defacto resource for debugging application errors. Nanobox provides a few different options for storing and viewing your app's logs.

### log_watch
The `log_watch` config available to web and worker components allows you to pipe data written to specific files into your app's aggregated log stream rather than writing to the actual file. This allows you to include custom application logs in your app's log stream and make them available [in your app dashboard](#).

```yaml
# Generic log_watch Example
web.main:
  log_watch:
    app[error]: path/to/log-dir/error.log
```

More information about the `log_watch` config is available in the [Application Logs documentation](https://docs.nanobox.io/app-config/app-logs/).

### writable_dirs
The `writable_dirs` config option available to web and worker components allows you to specify directories that should have writable permissions (by default, everything is read-only in production). Log files can then be created and written to inside a writable directory.

```yaml
# Generic writable_dirs Example
web.main:
  writable_dirs:
    - path/to/log-dir
```

More information about the `writable_dirs` config is available in the [Writable Directories documentation](https://docs.nanobox.io/app-config/writable-dirs/).

##### Caveats with Writable Directories
There are some caveats to know about when using writable_dirs to store logs:
- Writable directories are stored in the local filesystem of each node. If you're running a multi-node component, each node will have a unique log file.
- Writable directories are flushed on each deploy.
- The only way to view the contents of writable directories is to console in.

### network_dirs
The `network_dirs` config available to web and worker components allows you to store specific directories in a centralized, shared, writable filesystem. These require a storage component in which to store your network directories. Log files can then be created and written to inside a network directory stored in your storage component.

```yaml
# Generic network_dirs Example
web.main:
  network_dirs:
    data.storage:
      - path/to/log-dir

data.storage:
  image: nanobox/unfs:0.9
```

More information about the `network_dirs` config is available in the [Network Storage documentation](https://docs.nanobox.io/app-config/writable-storage/).

##### Caveats with Network Directories
There are some caveats to know about when using network_dirs to store logs:
- Network directories require a [storage component](/storage) to be stored in.
- The only way to view the contents of network directories is to console into your storage component.

## Viewing Your Logs
Depending on which method you use to store your logs, the method of viewing changes.

### Viewing log_watch'd Logs
Data written to log_watch'd files are piped into your app's log stream. Your app's log stream is available in your dashboard under the "Logs" tab.

![Viewing Logs in Your Dashboard](/assets/shared/debugging-dashboard-logs.png)

### Viewing Logs in writable_dirs
Since writable directories are stored in your components' nodes' local filesystem, you have to console into your component to view them. If you have a multi-node web or worker, you can specify a specific node to console into.

```bash
# console into a web/worker (no specific node)
nanobox console web.main

# console into a web/worker (specific node)
nanobox console web.main.1.1

# tail the error.log
tail path/to/log-dir/error.log
```

### Viewing Logs in network_dirs
Since network directories are stored in your storage component, you have to console into it to view them. All network directories are stored relative to the `~/data` directory in your storage component's filesystem.

```bash
# console into your storage component
nanobox console data.storage

# tail the error.log
tail data/path/to/log-dir/error.log
```
