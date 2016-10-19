# Writable Permissions

Many apps need writable permissions on specific directories for things like uploads, logs, etc. Apps deployed with Nanobox are read-only, but architected so they can run in a multi-node or distributed setup. There are things to consider when dealing with writable permissions in this type of architecture.

## The Problem
If a web or worker component is scaled to multiple nodes, each node has its own filesystem. Files written to the filesystem by one node won't be available to the other nodes. This is fine for some use cases, but problematic for others. For example, if your app needs to store user uploads, uploaded files need to be available to all web/worker nodes.

There are two possible solutions for handling writable permissions in your app.

- [Network Directories](#network-directories)
- [Writable Directories](#writable-directories)

## Network Directories
Network directories provide a solution for apps that need the contents of a directory with writable permissions to be shared with all nodes in a component. They require a [storage component](/storage) on which to store written files. These files are then mounted into web/worker components with network mounts and shared between nodes.

```yaml
web.main:
  network_dirs:
    data.storage:
      - path/to/dirA
      - path/to/dirB

data.storage:
  image: nanobox/unfs:0.9
```

For the detailed explanation of how `network_dirs` are configured and work, view the [Network Storage documentation](https://docs.nanobox.io/app-config/network-storage/).

### Use Cases
Network directories are ideal for things like user uploads and sessions *(if you must store sessions in the filesystem)*. These types of files should be shared across all nodes.

### Caveats
- Requests to network directories must cross your app's internal network. While minimal, this will add latency to requests.

## Writable Directories
Writable directories provide a solution for apps that don't need written files to be shared between nodes. Anything written to this directories are stored in the local filesystem of each node.

```yaml
web.main:
  writable_dirs:
    - path/to/dirA
    - path/to/dirB
```

For the detailed explanation of how `writable_dirs` are configured and work, view the [Writable Directories documentation](https://docs.nanobox.io/app-config/writable-directories/).

### Use Cases
Writable directories are ideal for things like caches, temporary storage, etc. - anything that doesn't need to be shared with other nodes in a multi-node architecture.

### Caveats
- Writable directories are flushed on each deploy, rebuild, scale, etc.
